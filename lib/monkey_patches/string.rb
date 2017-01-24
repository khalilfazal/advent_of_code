autoload :Boolean, 'helpers/boolean'
require 'English'

# Reimplemented String#lines which doesn't remove newline characters
class String
  alias _eql? eql?

  # Splits a +String+ into lines, Haskell style
  #
  # @param separator String
  #
  # @return Array of String
  def lines(separator = $RS)
    split separator
  end

  # Returns an +Array+ of size two where the first element is a prefix of length n
  # and the second is the rest of the +String+
  #
  # Example
  #
  #   'hello world'.split_at 5
  #   # => ['hello', ' world']
  #
  # @param n Integer
  #
  # @return [String]
  def split_at(n)
    [slice!(0 .. n - 1), self]
  end

  # If two +String+ are equal, they must have the same encoding
  #
  # @param other String
  #
  # @return Boolean
  def eql?(other)
    _eql?(other) && encoding.eql?(other.encoding)
  end

  # If two +Strings+ are not equal
  #
  # @param other String
  #
  # @return Boolean
  def not_eql?(other)
    !eql? other
  end
end