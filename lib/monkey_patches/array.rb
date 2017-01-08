autoload :Boolean, 'helpers/boolean'
require 'English'

# +Element+ of an array
class Element < Object
end

# Added methods to get the most and least common element in array (+mode+ and +rarest+).
# Added methods to get elements with +odd+ and +even+ indices.
class Array
  alias old_flat_map flat_map
  alias old_join join

  # @param elem Element
  #
  # @return [Element]
  def delete_elem(elem)
    reject(&elem.method(:===))
  end

  # @return [Element]
  def even
    select_index :even?
  end

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
    '' + old_join(separator)
  end

  # @param n Integer
  # @block f Proc: Object -> Enumerable
  #
  # @return [Element]
  def flat_map(n = 1, &f)
    old_flat_map do |elem|
      if n.eql? 1
        f.call elem
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

  # @return [Element]
  def odd
    select_index :odd?
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
  # @return [Element]
  def select_index(method)
    select.with_index do |_, i|
      i.send method
    end
  end
end