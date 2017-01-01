class Array
  # @return [Element]
  def abas
    map do |sequence|
      sequence.linksOf(3).find_all do |a, b, c|
        a === c && !(a === b)
      end
    end.flat_map(2, &:join)
  end
end