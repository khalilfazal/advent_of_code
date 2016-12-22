require_all 'lib/advent_of_code/year_2016/day_1/*'
require 'advent_of_code'
require 'helpers/cache_input'
require 'helpers/skip'

include AdventOfCode

describe 'Year2016::Day1' do
  before :all do
    @input = cache_input
  end

  context 'Compass' do
    subject { Compass::NORTH }

    it "'s @clockwise neighbour is Compass::WEST" do
      expect(subject.clockwise).to equal Compass::WEST
    end

    it "'s #neighbours= is private" do
      expect { subject.neighbours = Compass::WEST, Compass::EAST }.to raise_exception NoMethodError
    end

    it 'can #cycle once around @clockwise' do
      expect(subject.cycle).to be === [Compass::NORTH,
          Compass::EAST,
          Compass::SOUTH,
          Compass::WEST
      ]
    end
  end

  context 'Point' do
    subject { Point }

    it "'s origin is (0, 0)" do
      expect(subject.origin.dims).to be === [0, 0]
    end

    it 'raises Compass::InvalidDirection when dir is invalid' do
      expect { subject.origin.move '' }.to raise_exception Compass::InvalidDirection
    end
  end

  context 'parsing String' do
    subject { InputError }

    it 'raises AdventOfCode::InputError when input is invalid' do
      expect { 'X0, '.parse_path }.to raise_exception subject
    end

    it 'raises AdventOfCode::InputError when direction is invalid' do
      expect { 'X'.parse_dir }.to raise_exception subject
    end
  end

  context 'examples and stars' do
    subject { Traveller }

    it 'passes example 1' do
      expect(subject.endpoints_distance 'R2, L3').to be === 5
    end

    it 'passes example 2' do
      expect(subject.endpoints_distance 'R2, R2, R2').to be === 2
    end

    it 'passes example 3' do
      expect(subject.endpoints_distance 'R5, L5, R5, R3').to be === 12
    end

    it 'anchieves star 1' do
      skip_this_on_network_error { expect(subject.endpoints_distance @input).to be === 236 }
    end

    it 'passes example 4' do
      expect(subject.twice_visited_points_distance 'R8, R4, R4, R8').to be === 4
    end

    it 'anchieves star 2' do
      skip_this_on_network_error { expect(subject.twice_visited_points_distance @input).to be === 182 }
    end
  end
end