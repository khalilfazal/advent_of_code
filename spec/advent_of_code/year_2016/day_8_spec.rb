require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_8/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day8 do
  let (:input) { @input ||= described_class::input.lines }

  before :all do
    @example_screen = Screen.new 7, 3
    @test_screen = Screen.new 50, 6
  end

  context 'examples and stars' do
    it 'example 1: can create a small rectangle in the top-left corner' do
      # noinspection RubyResolve
      expect(@example_screen.prompt 'rect 3x2').to be_identical_to_string <<~SCREEN
        ###....
        ###....
        .......
      SCREEN
    end

    it 'example 2: can rotate the second column down by one pixel' do
      # noinspection RubyResolve
      expect(@example_screen.prompt 'rotate column x=1 by 1').to be_identical_to_string <<~SCREEN
        #.#....
        ###....
        .#.....
      SCREEN
    end

    it 'example 3: can rotate the the top row right by four pixels' do
      # noinspection RubyResolve
      expect(@example_screen.prompt 'rotate row y=0 by 4').to be_identical_to_string <<~SCREEN
        ....#.#
        ###....
        .#.....
      SCREEN
    end

    it 'example 4: can rotate the second column down by one pixel, causing the bottom pixel to wrap back to the top' do
      # noinspection RubyResolve
      expect(@example_screen.prompt 'rotate column x=1 by 1').to be_identical_to_string <<~SCREEN
        .#..#.#
        #.#....
        .#.....
      SCREEN
    end

    it 'test 1: count the number of lit pixels' do
      expect(@test_screen.prompts(input).pixels).to be === 121
    end

    it 'test 2: what code is the screen trying to display?' do
      # noinspection RubyResolve
      expect(@test_screen.to_s).to be_identical_to_string <<~SCREEN
        ###..#..#.###..#..#..##..####..##..####..###.#....
        #..#.#..#.#..#.#..#.#..#.#....#..#.#......#..#....
        #..#.#..#.#..#.#..#.#....###..#..#.###....#..#....
        ###..#..#.###..#..#.#....#....#..#.#......#..#....
        #.#..#..#.#.#..#..#.#..#.#....#..#.#......#..#....
        #..#..##..#..#..##...##..####..##..####..###.####.
      SCREEN
    end
  end
end