autoload :Boolean, 'helpers/boolean'
autoload :Forwardable, 'forwardable'

# Can fulfil promises
class Bot < Entity
  extend Forwardable

  def_delegator :@microchips, :[], :[]

  # @param id Integer
  def initialize(id)
    super(id)
    @promises = {}
  end

  # @param low Integer
  # @param high Integer
  #
  # @return Bot
  def promise(low, high)
    @promises[:low] = low
    @promises[:high] = high

    self
  end

  # @param entity Symbol
  #
  # @return Boolean
  def promised_to?(entity)
    @promises.key? entity
  end

  # @param entity Symbol
  def givee(entity)
    @promises[entity]
  end
end