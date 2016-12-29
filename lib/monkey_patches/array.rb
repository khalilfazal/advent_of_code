class Array
  alias_method :old_join, :join

  # @param
  def delete_elem(elem)
    reject(&elem.method(:===))
  end

  # @param separator String
  #
  # @return String
  def join(separator = $,)
    '' + old_join(separator)
  end

  # http://stackoverflow.com/a/1909239/710755
  #
  # @return Element
  def mode
    mode_generic :max
  end

  def rare
    mode_generic :min
  end

  # @return String
  def unlines
    join $/
  end

  private

  def mode_generic(type)
    group_by(&:itself).send(type) do |x, y|
      x[1].length <=> y[1].length
    end[0]
  end
end