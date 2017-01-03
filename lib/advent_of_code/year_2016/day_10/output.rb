# can't give to other entities or make promises
class Output < Entity
  # @return Integer
  def output
    # noinspection RubyResolve
    @microchips.first
  end
end