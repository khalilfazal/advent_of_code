autoload :Boolean, 'helpers/boolean'

# Either a +Bot+ or +Output+
class Entity
  attr_reader :id
  attr_reader :microchips

  class << self
    # @param type String
    # @param id Integer
    #
    # @return Entity
    def create(type, id)
      type.capitalize.constantize.new id
    end
  end

  # @param id Integer
  def initialize(id)
    @id = id
    @microchips = []
  end

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

  # @return Boolean
  def full?
    @microchips.length === 2
  end
end