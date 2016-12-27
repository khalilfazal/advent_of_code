class Integer
  # @return Integer
  def to_nat
    twice = 2 * self

    if self >= 0
      twice
    else
      twice.negate.pred
    end
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