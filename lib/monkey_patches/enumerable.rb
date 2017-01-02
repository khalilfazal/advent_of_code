# added method to group equal elements together
module Enumerable
  # @return Enumerable
  def group_eq
    group_by(&:itself)
  end
end