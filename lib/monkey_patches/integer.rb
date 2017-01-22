# Added here any number theoretical methods for integers
class Integer
  # Maps this +Integer+ to a non-negative +Integer+
  #
  # @return Integer
  def to_nonneg
    twice = 2 * self

    self >= 0 ? twice : twice.negate.pred
  end

  # A postfix version of Integer#-@
  #
  # @return Integer
  def negate
    -self
  end

  # Determines the triangle number for this +Integer+
  #
  # https://en.wikipedia.org/wiki/Triangular_number
  #
  # @return Integer
  def triangle_num
    self * succ / 2
  end
end