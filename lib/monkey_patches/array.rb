autoload :Boolean, 'helpers/boolean'
require 'English'

# +Element+ of an array
class Element < Object
end

# Added methods to get the most and least common element in array (+mode+ and +rarest+).
# Added methods to get elements with +odd+ and +even+ indices.
class Array
  alias _flat_map flat_map
  alias _join join

  # Deletes all elements in the +Array+ equaling +elem+
  #
  # @param elem Element
  #
  # @return Array of Element
  def delete_elem(elem)
    reject(&elem.method(:eql?))
  end

  # Gets +Element+s at +even+ indices
  #
  # @return Array of Element
  def even
    select_index :even?
  end

  # Gets +Element+s at +odd+ indices
  #
  # @return Array of Element
  def odd
    select_index :odd?
  end

  # Is the +Array+ not +empty+?
  #
  # @return Boolean
  def full?
    !empty?
  end

  # A work around for https://bugs.ruby-lang.org/issues/8289
  #
  # @param separator Element
  #
  # @return String
  def join(separator = $OFS)
    '' + _join(separator)
  end

  # Improves Array#flat_map by allowing it to apply a function deep within the nested array
  #
  # @param n Integer
  # @block f Proc: Object -> Enumerable
  #
  # @return Array of Element
  def flat_map(n = 1, &f)
    _flat_map do |elem|
      if n.eql? 1
        yield elem
      else
        elem.flat_map n - 1, &f
      end
    end
  end

  # http://stackoverflow.com/a/1909239/710755
  #
  # @return Element
  def mode
    mode_generic :max
  end

  # Finds the +rarest+ +Element+ in an +Array+
  #
  # @return Element
  def rarest
    mode_generic :min
  end

  # Changes an +Array+ into a +String+ separated by newlines
  #
  # @return String
  def unlines
    join $RS
  end

  private

  # @param type Symbol
  #
  # @return Element
  def mode_generic(type)
    group_by(&:itself).send(type) do |x, y|
      x[1].length <=> y[1].length
    end[0]
  end

  # @param method Symbol
  #
  # @return Array of Element
  def select_index(method)
    select.with_index do |_, i|
      i.send method
    end
  end
end