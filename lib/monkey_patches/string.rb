require 'English'

# reimplemented String#lines which doesn't remove newline characters
class String
  # @param separator String
  #
  # @return [String]
  def lines(separator = $RS)
    split separator
  end

  # @param n Integer
  #
  # @return [String]
  def split_at(n)
    [slice!(0 .. n - 1), self]
  end
end