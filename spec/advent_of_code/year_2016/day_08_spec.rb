require_all 'lib/advent_of_code/year_2016/day_08/*'

require 'advent_of_code'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day8 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input.lines }

  let (:test_screen) do
    skip_this_when_dced do
      @test_screen ||= Screen.new(50, 6).prompts(input)
    end

    @test_screen
  end

  context 'examples and stars' do
    example_screen = Screen.new 7, 3

    it 'passes example 1: can create a small rectangle in the top-left corner' do
      # noinspection RubyResolve
      expect(example_screen.prompt 'rect 3x2').to be_identical_to_string <<~SCREEN
        ###....
        ###....
        .......
      SCREEN
    end

    it 'passes example 2: can rotate the second column down by one pixel' do
      # noinspection RubyResolve
      expect(example_screen.prompt 'rotate column x=1 by 1').to be_identical_to_string <<~SCREEN
        #.#....
        ###....
        .#.....
      SCREEN
    end

    it 'passes example 3: can rotate the the top row right by four pixels' do
      # noinspection RubyResolve
      expect(example_screen.prompt 'rotate row y=0 by 4').to be_identical_to_string <<~SCREEN
        ....#.#
        ###....
        .#.....
      SCREEN
    end

    it 'passes example 4: can rotate the second column down by one pixel, causing the bottom pixel to wrap back to the top' do
      # noinspection RubyResolve
      expect(example_screen.prompt 'rotate column x=1 by 1').to be_identical_to_string <<~SCREEN
        .#..#.#
        #.#....
        .#.....
      SCREEN
    end

    it 'achieves star 1: count the number of lit pixels' do
      expect(test_screen.pixels).to be === 121
    end

    it 'achieves star 2: what code is the screen trying to display?' do
      # noinspection RubyResolve
      expect(test_screen.to_s).to be_identical_to_string <<~SCREEN
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