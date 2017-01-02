# added methods here instead of Fixnum because Fixnum and Bignum will both be merged in 2.4
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