class Array
  alias_method :old_join, :join

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