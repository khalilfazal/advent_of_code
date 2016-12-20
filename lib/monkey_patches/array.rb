class Array
  alias_method :old_join, :join

  def self.singleton(e)
    [] << e
  end

  def join(separator = $,)
    '' + old_join(separator)
  end

  def join_with_prefix(prefix = '', separator = '')
    map do |e|
      prefix.to_s + e.to_s
    end.join separator
  end

  def unlines
    join "\n"
  end
end