require 'exceptions/input_error'

class String
  def parse_path
    parse_error = InputError.new 'Invalid input'

    self.split(/, /).map do |block|
      matches = block.match(/(L|R)([0-9]+)/)

      if matches.nil?
        raise parse_error
      end

      dir, n = matches.captures

      [case dir
         when 'L'
           :left
         when 'R'
           :right
         else
           raise parse_error
       end, n.to_i]
    end
  end
end