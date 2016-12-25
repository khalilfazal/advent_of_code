class Integer
  def to_nat
    twice = 2 * self

    if self >= 0
      twice
    else
      twice.negate.pred
    end
  end

  def negate
    -self
  end

  # https://en.wikipedia.org/wiki/Triangular_number
  def triangle_num
    self * succ / 2
  end
end