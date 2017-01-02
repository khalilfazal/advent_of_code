require 'English'
require 'monkey_patches/hash'

# contains bots and outputs
class World
  attr_reader :entities

  private_class_method :new

  class << self
    def run(commands)
      world = new

      commands.each do |command|
        world.run_command command
      end

      world
    end
  end

  def initialize
    @entities = {}
  end

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

  def bot_with_chips(microchips)
    @entities.values.find do |v|
      v.microchips === microchips
    end.id
  end

  def output_products(outputs)
    outputs(outputs).map(&:output).inject :*
  end

  private

  def entity_regex(entity)
    /(?<#{entity}_key>(?<#{entity}_type>output|bot) (?<#{entity}_id>\d+))/
  end

  def execute(command, info, *args)
    @entities.update!(info[:key], ->(u) { u.send command, *args }) do
      Entity.create info[:type], info[:id]
    end.tap do |updated|
      if updated.is_a?(Bot) && updated.full?
        give updated, :low
        give updated, :high
      end
    end
  end

  def give(giver, givee)
    execute :receive, giver.giftee(givee), giver[givee] if giver.promised_to? givee
  end

  def outputs(outputs)
    @entities.values_at(*outputs.map do |output|
      "output #{output}"
    end)
  end
end