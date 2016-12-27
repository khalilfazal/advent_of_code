# Remove when we can move to 2.4
module Comparable

  # @param min Comparable
  # @param max Comparable
  #
  # @return Comparable
  def clamp(min, max)
    [[self, max].min, min].max
  end
end