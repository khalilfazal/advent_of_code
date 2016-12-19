class Array
  alias_method :old_join, :join

  def contains_dup(elem)
    rindex(elem) != index(elem)
  end

  def first_dup
    detect do |elem|
      contains_dup elem
    end
  end

  def join(separator = $,)
    '' + old_join(separator)
  end

  def unlines
    join "\n"
  end
end