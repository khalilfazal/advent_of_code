autoload :Boolean, 'helpers/boolean'

require 'monkey_patches/array'
require 'monkey_patches/string'

# Can check if an +IPV7+ string supports tls or ssl
module IPV7
  # @return Boolean
  def tls?
    nets.even.any?(&:abba?) && nets.odd.none?(&:abba?)
  end

  # @return [String]
  def nets
    split(/\[|\]/)
  end

  # @return Boolean
  def abba?
    links_of(4).any? do |a, b, c, d|
      a.eql?(d) && b.eql?(c) && a.not_eql?(b)
    end
  end

  # @param n Integer
  #
  # @return [[String]]
  def links_of(n)
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
    a, b, = chars
    [b, a, b].join
  end
end

# prepend IP to String
class String
  prepend IPV7
end