# Can't give to other Entities or make promises
class Output < Entity
  # Gets the microchip in the output
  # Assuming that the +Output+ only receives one microchip
  #
  # @return Integer
  def output
    # noinspection RubyResolve
    @microchips.first
  end
end