require 'English'
require 'monkey_patches/hash'

# Contains +Bots+ and +Outputs+
class World
  attr_reader :entities

  private_class_method :new

  class << self
    # Constructs a world,
    # and runs each command on the world
    #
    # @param commands [String]
    #
    # @return World
    def run(commands)
      new.tap do |world|
        commands.each(&world.method(:run_command))
      end
    end
  end

  def initialize
    @entities = {}
  end

  # @param command String
  def run_command(command)
    case command
      when /value (?<microchip>\d+) goes to #{entity_regex :receiver}/
        execute :receive, *$LAST_MATCH_INFO.capture_entities(:receiver), $LAST_MATCH_INFO[:microchip].to_i
      when /#{entity_regex :giver} gives low to #{entity_regex :lower} and high to #{entity_regex :higher}/
        execute :promise, *$LAST_MATCH_INFO.capture_entities(:giver, :lower, :higher)
      else
        raise ParseError, "Invalid command: #{command}"
    end
  end

  # Gets the bot id of the bot with a particular low/high pair of microchips
  #
  # @param microchips Hash[Symbol, Integer]
  #
  # @return Integer
  def bot_with_chips(microchips)
    @entities.values.find do |v|
      v.microchips === microchips
    end.id
  end

  # Gets the product of the microchips held by the output entities
  #
  # @param outputs Range
  #
  # @return Integer
  def output_product_of_chips(outputs)
    outputs(outputs).map(&:output).inject :*
  end

  private

  # Generates the regexp to extract an entity's full name, type and id from a command
  #
  # @param entity Symbol
  #
  # @return Regexp
  def entity_regex(entity)
    /(?<#{entity}_key>(?<#{entity}_type>output|bot) (?<#{entity}_id>\d+))/
  end

  # Executes a command (either :receive or :promise) using an entity's info
  #
  # For :receive, args[0] is the microchip being received
  # For :promise, args[0] and arg[1] are the low and high ids (respectively) of the entities this bot is promising to give to
  #
  # @param command Symbol
  # @param info Hash[Symbol, String | Integer]
  # @param args Array[Integer | Hash[Symbol, String | Integer]]
  #
  # @return Entity
  def execute(command, info, *args)
    @entities.update!(info[:key], ->(u) { u.send command, *args }) do
      Entity.create info[:type], info[:id]
    end.tap do |updated|
      if updated.is_a?(Bot) && updated.full?
        donate updated, :low
        donate updated, :high
      end
    end
  end

  # Give either a low or high microchip to another entity
  #
  # @param giver Bot
  # @param low_or_high Symbol
  #
  # @return Entity
  def donate(giver, low_or_high)
    execute :receive, giver.givee(low_or_high), giver[low_or_high] if giver.promised_to? low_or_high
  end

  # Gets all the output entities
  #
  # @param outputs Range
  #
  # @return Hash[String, Entity]
  def outputs(outputs)
    @entities.values_at(*outputs.map do |output|
      "output #{output}"
    end)
  end
end