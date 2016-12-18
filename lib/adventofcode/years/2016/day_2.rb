require_relative '2016'

module Adventofcode::Year_2016::Day_2
  include Adventofcode::Year_2016

  def self.get_input
    Year_2016.get_input(day: 2)
  end

  class Keypad
    def self.bathroom_code(instructions: Day_2.get_input, layout: imagined_layout)
      keypad = Keypad.new layout: layout

      '' + instructions.lines.map do |line|
        line.split('').each do |instruction|
          keypad.move instruction
        end

        keypad.pos
      end.join
    end

    def pos
      @grid[@pos - 1]
    end

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
      end

      @pos = old_pos if pos === ' '
    end

    private

    def self.imagined_layout
      1.upto(9).to_a.join
    end

    def initialize(layout:)
      @grid  = layout
      @sides = Math.sqrt(layout.length).floor
      @pos   = layout.index('5') + 1
    end
  end
end