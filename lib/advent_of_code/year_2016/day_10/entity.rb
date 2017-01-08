autoload :Boolean, 'helpers/boolean'

# Either a +Bot+ or +Output+
class Entity
  attr_reader :id
  attr_reader :microchips

  class << self
    # Either creates a +Bot+ or an +Output+ with a specified +id+
    #
    # @param type String
    # @param id Integer
    #
    # @return Entity
    def create(type, id)
      type.capitalize.constantize.new id
    end
  end

  # A +Bot+ is giving this +Entity+ a +microchip+
  # If this +Entity+ now has two +microchips+, they are labelled either as +:low+ or +:high+
  #
  # @param microchip Integer
  #
  # @return Entity
  def receive(microchip)
    @microchips << microchip

    if full?
      @microchips = {
        low: @microchips.min,
        high: @microchips.max
      }
    end

    self
  end

  # Does this +Entity+ have two +microchips+?
  #
  # @return Boolean
  def full?
    @microchips.length.eql? 2
  end

  protected

  # Creates an +Entity+ with a specified +id+
  # It initially has no microchips
  #
  # Examples
  #
  #   Bot.new 42
  #   # => #<Bot:0x0>
  #
  #   or
  #
  #   Output.new 42
  #   # => #<Output0x0>
  #
  # @param id Integer
  def initialize(id)
    @id = id
    @microchips = []
  end
end