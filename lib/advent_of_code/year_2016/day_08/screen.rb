autoload :Boolean, 'helpers/boolean'
require 'monkey_patches/array'

# A dot-matrix screen that can be manipulated with commands
class Screen
  # Create a two dimensional dot-matrix screen
  #
  # @param width Integer
  # @param height Integer
  def initialize(width, height)
    @screen = Array.new height do
      Array.new width, '.'
    end

    @major = :row
  end

  # Runs each command line to change the +Screen+'s display
  #
  # @param lines [String]
  #
  # @return Screen
  def prompts(lines)
    lines.each do |line|
      prompt line, display: false
    end

    self
  end

  # Runs each command line to change the +Screen+'s display
  # Can either draw a rectangle or shift along a row or column.
  #
  # @param raw String
  # @param display Boolean
  #
  # @return String | NilClass
  def prompt(raw, display: true)
    if (parsed = raw.match(/rect (\d+)x(\d+)/))
      rect(*parsed.captures.map(&:to_i))
    elsif (parsed = raw.match(/rotate (column|row) (?:x|y)=(\d+) by (\d+)/))
      dim, i, amount = *parsed.captures
      rotate dim.to_sym, i.to_i, amount.to_i
    end

    to_s if display
  end

  # Counts the number of pixels turned on
  #
  # @return Integer
  def pixels
    @screen.flatten.count '#'
  end

  # Displays the screen
  #
  # @return String
  def to_s
    output = @screen
    output = output.transpose if transposed?
    "#{output.map(&:join).unlines}\n"
  end

  private

  # Draws a rectangle
  #
  # @param x Integer
  # @param y Integer
  def rect(x, y)
    x, y = y, x if transposed?

    (0 .. y - 1).each do |i|
      (0 .. x - 1).each do |j|
        @screen[i][j] = '#'
      end
    end
  end

  # Whether +@screen+ is currently transposed
  #
  # @return Boolean
  def transposed?
    @major.eql? :column
  end

  # Rotates along a row or column
  #
  # @param dim Symbol either :row or :column
  # @param i Integer
  # @param amount Integer
  #
  # @return [String]
  def rotate(dim, i, amount)
    unless dim.eql? @major
      @screen = @screen.transpose
      @major = dim
    end

    @screen[i].rotate!(-amount)
  end
end