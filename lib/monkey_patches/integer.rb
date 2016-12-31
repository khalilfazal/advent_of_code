class Integer
  # @return Integer
  def to_nat
    twice = 2 * self

    (self >= 0) ? twice : twice.negate.pred
  end

  # @return Integer
  def negate
    -self
  end

  # https://en.wikipedia.org/wiki/Triangular_number
  #
  # @return Integer
  def triangle_num
    self * succ / 2
  end
end