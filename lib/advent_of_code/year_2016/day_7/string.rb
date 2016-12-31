require 'helpers/boolean'
require 'helpers/element'
require 'monkey_patches/array'

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

class String
  # @return Boolean
  def tls?
    nets.even.any?(&:abba?) && nets.odd.none?(&:abba?)
  end

  # @return [String]
  def nets
    split /\[|\]/
  end

  # @return Boolean
  def abba?
    linksOf(4).any? do |a, b, c, d|
      a === d && b === c && !(a === b)
    end
  end

  # @param n Integer
  #
  # @return [[String]]
  def linksOf(n)
    chars.each_cons n
  end

  # @return Boolean
  def ssl?
    odds = nets.even.abas.map(&:opposite)
    evens = nets.odd.abas

    (odds & evens).full?
  end

  # @return String
  def opposite
    a, b, _ = self.chars
    [b, a, b].join
  end
end