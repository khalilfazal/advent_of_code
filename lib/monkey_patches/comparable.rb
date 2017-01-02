# implements Comparable#clamp which will be added in ruby 2.4
module Comparable
  # @param min Comparable
  # @param max Comparable
  #
  # @return Comparable
  def clamp(min, max)
    [[self, max].min, min].max
  end
end