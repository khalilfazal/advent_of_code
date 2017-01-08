# Monkey patch for all Enumerables
module Enumerable
  # Group equal elements together
  #
  # @return Enumerable
  def group_eq
    group_by(&:itself)
  end
end