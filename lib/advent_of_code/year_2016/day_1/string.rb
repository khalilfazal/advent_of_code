class String
  def parse_path
    split(/, /).map do |block|
      matches = block.match /(L|R)([0-9]+)/

      if matches.nil?
        raise AdventOfCode::InputError.new "Invalid input '#{block}'"
      end

      dir, n = matches.captures

      [dir.parse_dir, n.to_i]
    end
  end

  def parse_dir
    case self
      when 'L'
        :clockwise
      when 'R'
        :widdershins
      else
        raise AdventOfCode::InputError.new "Invalid input '#{self}'"
    end
  end
end