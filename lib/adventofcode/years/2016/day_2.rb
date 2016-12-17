require_relative '2016'

module Adventofcode::Year_2016::Day_2
  class Keypad
    include Adventofcode::Year_2016

    attr_reader :pos

    def self.bathroom_code(instructions = get_input, sides = 3)
      keypad       = Keypad.new sides
      instructions = instructions.lines if instructions.is_a? String

      Integer(instructions.map do |line|
        line.split('').each do |instruction|
          keypad.instance_eval do
            move instruction
          end
        end

        keypad.pos
      end.join, 10)
    end

    private

    def self.get_input
      Year_2016.get_input(day: 2)
    end

    def initialize(sides)
      @sides = sides
      @area  = sides ** 2
      @pos   = (@area + 1) / 2
    end

    def move(dir)
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
    end
  end
end