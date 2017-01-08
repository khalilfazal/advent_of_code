autoload :Boolean, 'helpers/boolean'
autoload :Forwardable, 'forwardable'

# Can fulfil promises
class Bot < Entity
  extend Forwardable

  def_delegator :@microchips, :[], :[]

  # The +Bot+ initially keeps no promises
  #
  # @param id Integer
  def initialize(id)
    super
    @promises = {}
  end

  # Promise to give its +:low+ or +:high+ +@microchips+ to another +Entity+
  #
  # @param low Integer
  # @param high Integer
  #
  # @return Bot
  def promise(low, high)
    @promises[:low] = low
    @promises[:high] = high

    self
  end

  # Has this +Bot+ promised to give a +kind+ of +microchip+?
  #
  # @param kind Symbol
  #
  # @return Boolean
  def promised_to?(kind)
    @promises.key? kind
  end

  # Get the +id+ of the +Entity+ that was promised a +kind+ of +microchip+
  #
  # @param kind Symbol
  def givee(kind)
    @promises[kind]
  end
end