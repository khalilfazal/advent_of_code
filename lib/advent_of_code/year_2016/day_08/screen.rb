require 'helpers/boolean'
require 'monkey_patches/array'

class Screen
  # @param width Integer
  # @param height Integer
  def initialize(width, height)
    @screen = Array.new height do
      Array.new width, '.'
    end

    @major = :row
  end

  # @param lines [String]
  #
  # @return Screen
  def prompts(lines)
    lines.each do |line|
      prompt line, display: false
    end

    self
  end

  # @param raw String
  # @param display Boolean
  #
  # @return String|NilClass
  def prompt(raw, display: true)
    if (parsed = raw.match(/rect (\d+)x(\d+)/))
      rect(*parsed.captures.map(&:to_i))
    elsif (parsed = raw.match(/rotate (column|row) (?:x|y)=(\d+) by (\d+)/))
      dim, i, amount = *parsed.captures
      rotate dim.to_sym, i.to_i, amount.to_i
    end

    self.to_s if display
  end

  # @return Integer
  def pixels
    @screen.flatten.count '#'
  end

  # @return String
  def to_s
    output = @screen
    output = output.transpose if transposed?
    "#{output.map(&:join).unlines}\n"
  end

  private

  # @param x Integer
  # @param y Integer
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

  # @return Boolean
  def transposed?
    @major === :column
  end

  # @param dim Symbol
  # @param i Integer
  # @param amount Integer
  #
  # @return [String]
  def rotate(dim, i, amount)
    unless dim === @major
      @screen = @screen.transpose
      @major = dim
    end

    @screen[i].rotate!(-amount)
  end
end