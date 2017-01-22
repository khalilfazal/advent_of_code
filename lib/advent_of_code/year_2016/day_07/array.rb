require 'monkey_patches/string'

# I think using methods look neater than using functions
# Object.m() versus f(Object)
class Array
  # Finds all aba sequences in the +Array+
  # Assume that self is an Array of String.
  #
  # @return Array of String
  def abas
    map do |sequence|
      sequence.substrings_of(3).find_all do |a, b, c|
        a.eql?(c) && a.not_eql?(b)
      end
    end.flat_map(2, &:join)
  end
end