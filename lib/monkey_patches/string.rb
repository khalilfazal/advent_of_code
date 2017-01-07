autoload :Boolean, 'helpers/boolean'
require 'English'

# Reimplemented String#lines which doesn't remove newline characters
class String
  alias old_eql? eql?

  # @param separator String
  #
  # @return [String]
  def lines(separator = $RS)
    split separator
  end

  # Returns an +Array+ of size two where the first element is a prefix of length n
  # and the second is the rest of the +String+
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
    old_eql?(other) && encoding.eql?(other.encoding)
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