class String
  def parse_commands
    split(/, /).map do |block|
      matches = block.match /(?<dir>L|R)(?<n>[0-9]+)/

      if matches.nil?
        raise ParseError, "Invalid input '#{block}'"
      end

      [matches['dir'].parse_dir] + ([:straight] * matches['n'].to_i)
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