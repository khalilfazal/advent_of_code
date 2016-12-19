class String
  def parse_path
    self.split(/, /).map do |block|
      dir, n = block.match(/(L|R)([0-9]+)/).captures

      [case dir
         when 'L'
           :left
         when 'R'
           :right
       end, n.to_i]
    end
  end
end