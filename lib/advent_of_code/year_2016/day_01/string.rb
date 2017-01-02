# parse travel commands
class String
  # @return [Symbol]
  def parse_commands
    split(/, /).map do |block|
      matches = block.match(/(?<dir>L|R)(?<n>[0-9]+)/)

      raise ParseError, "Invalid input: #{block}" if matches.nil?

      [matches['dir'].parse_dir] + ([:straight] * matches['n'].to_i)
    end.inject :+
  end

  # @return Symbol|ParseError
  def parse_dir
    case self
      when 'L'
        :widdershins
      when 'R'
        :clockwise
      else
        raise ParseError, "Invalid input: #{self}"
    end
  end
end