# I think using methods look neater than using functions
# Object.m() versus f(Object)
class Array
  # @return [Element]
  def abas
    map do |sequence|
      sequence.links_of(3).find_all do |a, b, c|
        a === c && !(a === b)
      end
    end.flat_map(2, &:join)
  end
end