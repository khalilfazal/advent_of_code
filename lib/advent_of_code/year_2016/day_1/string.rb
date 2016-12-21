require 'exceptions/input_error'

class String
  def parse_path
    self.split(/, /).map do |block|
      matches = block.match /(L|R)([0-9]+)/

      if matches.nil?
        raise InputError.new 'Invalid input'
      end

      dir, n = matches.captures

      [dir.parse_dir, n.to_i]
    end
  end

  def parse_dir
    case self
      when 'L'
        :left
      when 'R'
        :right
      else
        # unreachable
        raise InputError.new 'Invalid input'
    end
  end
end