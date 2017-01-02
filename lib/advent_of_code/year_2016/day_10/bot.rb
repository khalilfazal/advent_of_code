require 'forwardable'

class Bot < Entity
  extend Forwardable

  def_delegator :@microchips, :[], :[]

  def initialize(id)
    super(id)
    @promises = {}
  end

  def promise(low, high)
    @promises[:low] = low
    @promises[:high] = high

    self
  end

  def promised_to?(entity)
    @promises.has_key? entity
  end

  def giftee(entity)
    @promises[entity]
  end
end