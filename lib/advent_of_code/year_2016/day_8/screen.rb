require 'monkey_patches/array'

class Screen
  def initialize(width, height)
    @screen = Array.new height do
      Array.new width, '.'
    end

    @major = :row
  end

  def prompts(lines)
    lines.each do |line|
      prompt line
    end

    self
  end

  def prompt(raw)
    if (parsed = raw.match(/rect (\d+)x(\d+)/))
      rect *parsed.captures.map(&:to_i)
    elsif (parsed = raw.match(/rotate (column|row) (?:x|y)=(\d+) by (\d+)/))
      dim, i, amount = *parsed.captures
      rotate dim.to_sym, i.to_i, amount.to_i
    end

    self.to_s
  end

  def rect(x, y)
    if transposed?
      x, y = y, x
    end

    (0 .. y - 1).each do |i|
      (0 .. x - 1).each do |j|
        @screen[i][j] = '#'
      end
    end
  end

  def transposed?
    @major === :column
  end

  def rotate(dim, i, amount)
    unless dim === @major
      @screen = @screen.transpose
      @major = dim
    end

    @screen[i].rotate! -amount
  end

  def pixels
    @screen.flatten.count '#'
  end

  def to_s
    output = @screen
    output = output.transpose if transposed?
    "#{output.map(&:join).unlines}\n"
  end
end