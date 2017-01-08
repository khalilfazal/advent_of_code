require 'monkey_patches/string'

# I think using methods look neater than using functions
# Object.m() versus f(Object)
class Array
  # Finds all aba sequences in the +Array+
  #
  # @return Array of Element
  def abas
    map do |sequence|
      sequence.substrings_of(3).find_all do |a, b, c|
        a.eql?(c) && !(a.eql?(b))
      end
    end.flat_map(2, &:join)
  end
end