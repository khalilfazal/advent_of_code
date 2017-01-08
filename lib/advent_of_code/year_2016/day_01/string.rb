# Parse travel commands
class String
  # Parses a command.
  #
  # Example command:
  #     L8R7
  #
  # mean turn left, move forward 8, turn right, move forward 7
  #
  # @return [Symbol]
  def parse_commands
    split(/, /).map do |block|
      matches = block.match(/(?<dir>L|R)(?<n>[0-9]+)/)

      raise ParseError, "Invalid input: #{block}" if matches.nil?

      [matches['dir'].parse_dir] + ([:straight] * matches['n'].to_i)
    end.inject :+
  end

  # Parses a direction either tot the left or right
  #
  # @return Symbol
  # @throws ParseError
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