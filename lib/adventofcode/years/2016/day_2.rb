require_relative '2016'

module Adventofcode::Year_2016::Day_2
  class Keypad
    include Adventofcode::Year_2016

    def self.bathroom_code(instructions = get_input, grid = default_grid)
      keypad       = Keypad.new grid: grid
      instructions = instructions.lines if instructions.is_a? String

      '' + instructions.map do |line|
        line.split('').each do |instruction|
          keypad.instance_eval do
            move instruction
          end
        end

        keypad.pos
      end.join
    end

    def pos
      @grid[@pos - 1]
    end

    private

    def self.get_input
      Year_2016.get_input(day: 2)
    end

    def self.default_grid
      1.upto(9).to_a.join
    end

    def initialize(grid:)
      @grid  = grid
      @sides = Math.sqrt(grid.length).floor
      @area  = @sides ** 2
      @pos   = 1 + grid.index('5')
    end

    def move(dir)
      old_pos = @pos

      case dir
        when 'U'
          @pos -= @sides if @pos > @sides
        when 'R'
          @pos += 1 if @pos % @sides != 0
        when 'D'
          @pos += @sides if @pos <= @area - @sides
        when 'L'
          @pos -= 1 if (@pos - 1) % @sides != 0
      end

      @pos = old_pos if pos === ' '
    end
  end
end