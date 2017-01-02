# can't give to other entities
class Output < Entity
  def output
    # noinspection RubyResolve
    @microchips.first
  end
end