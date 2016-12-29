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

  # @return String
  def unlines
    join $/
  end
end