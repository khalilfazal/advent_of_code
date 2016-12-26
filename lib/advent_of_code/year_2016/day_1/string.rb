class String
  def parse_commands
    split(/, /).map do |block|
      matches = block.match /(L|R)([0-9]+)/

      if matches.nil?
        raise ParseError, "Invalid input '#{block}'"
      end

      dir, n = matches.captures

      [dir.parse_dir] + ([:straight] * n.to_i)
    end.inject :+
  end

  def parse_dir
    case self
      when 'L'
        :widdershins
      when 'R'
        :clockwise
      else
        raise ParseError, "Invalid input '#{self}'"
    end
  end
end