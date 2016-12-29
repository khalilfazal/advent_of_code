module Enumerable
  def group_eq
    group_by(&:itself)
  end
end