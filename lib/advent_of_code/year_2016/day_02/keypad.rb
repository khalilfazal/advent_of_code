require 'monkey_patches/array'
require 'monkey_patches/string'

# can be used with different layouts
class Keypad
  private_class_method :new

  class << self
    # @param instructions String
    # @param layout String
    #
    # @return String
    def bathroom_code(instructions, layout = imagined_layout)
      keypad = new layout: layout

      instructions.lines.map do |line|
        line.chars.each do |instruction|
          keypad.move instruction
        end

        keypad.pos
      end.join
    end

    private

    # @return String
    def imagined_layout
      1.upto(9).to_a.join
    end
  end

  # @param layout String
  def initialize(layout:)
    @layout = layout
    @sides = Math.sqrt(layout.length).floor
    @pos = layout.index('5') + 1
  end

  # @return String
  def pos
    @layout[@pos - 1]
  end

  # @param dir String
  #
  # @return Integer
  def move(dir)
    old_pos = @pos

    case dir
      when 'U'
        @pos -= @sides if @pos > @sides
      when 'R'
        @pos += 1 if @pos % @sides != 0
      when 'D'
        @pos += @sides if @pos <= @sides ** 2 - @sides
      when 'L'
        @pos -= 1 if (@pos - 1) % @sides != 0
      else
        raise ParseError, "Invalid input: #{dir}"
    end

    @pos = old_pos if pos === ' '
  end
end