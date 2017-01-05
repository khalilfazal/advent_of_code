# Can't give to other Entities or make promises
class Output < Entity
  # @return Integer
  def output
    # noinspection RubyResolve
    @microchips.first
  end
end