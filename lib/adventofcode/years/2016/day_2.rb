require 'monkey_patches/string'

require_relative '2016'

module Adventofcode::Year_2016::Day_2
  class Keypad
    attr_reader :pos

    def self.bathroom_code(instructions, sides = 3)
      keypad = Keypad.new sides
      codes  = ''

      instructions.each do |line|
        line.split('').each do |instruction|
          keypad.instance_eval do
            move instruction
          end
        end

        codes += keypad.pos.to_s
      end

      codes
    end

    private

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
          @pos += @sides if @pos < @area
        when 'L'
          @pos -= 1 if (@pos - 1) % @sides != 0
      end
    end
  end
end