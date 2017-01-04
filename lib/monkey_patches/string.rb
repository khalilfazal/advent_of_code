autoload :Boolean, 'helpers/boolean'
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

  # returns this as an integer if possible
  # return this instead if an exception is raised
  #
  # @return Integer | String
  def to_i!
    Integer(self)
  rescue ArgumentError
    self
  end
end