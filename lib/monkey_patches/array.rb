require 'helpers/boolean'
require 'helpers/element'

class Array
  alias_method :old_flat_map, :flat_map
  alias_method :old_join, :join

  # @param elem Element
  #
  # @return [Element]
  def delete_elem(elem)
    reject &elem.method(:===)
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
  def join(separator = $,)
    '' + old_join(separator)
  end

  # @param n Integer
  # @block f
  #
  # @return [Element]
  def flat_map(n = 1, &f)
    old_flat_map do |elem|
      if n === 1
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

  # @return Element
  def rarest
    mode_generic :min
  end

  # @return String
  def unlines
    join $/
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