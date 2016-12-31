class String
  # @param separator String
  #
  # @return [String]
  def lines(separator = $/)
    split separator
  end

  # @param n Integer
  #
  # @return [String]
  def splitAt(n)
    [slice!(0 .. n - 1), self]
  end
end