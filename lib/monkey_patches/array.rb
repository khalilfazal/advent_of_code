class Array
  alias_method :old_join, :join

  def join(separator=$,)
    '' + old_join(separator)
  end

  def unlines
    join "\n"
  end
end