# either a Bot or Output
class Entity
  attr_reader :id
  attr_reader :microchips

  class << self
    def create(type, id)
      type.capitalize.constantize.new id
    end
  end

  def initialize(id)
    @id = id
    @microchips = []
  end

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

  def full?
    @microchips.length === 2
  end
end