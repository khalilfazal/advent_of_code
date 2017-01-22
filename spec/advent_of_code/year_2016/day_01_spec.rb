require_all 'lib/advent_of_code/year_2016/day_01/*'

require 'advent_of_code'
require 'helpers/match_string'
require 'racc/parser'
require 'rspec/its'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day1 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input }

  context Compass::NORTH do
    its(:clockwise) { is_expected.to equal Compass::EAST }

    it "'s #neighbours= is private" do
      expect { Compass::NORTH.neighbours = Compass::WEST, Compass::EAST }.to raise_exception NoMethodError
    end

    its(:cycle) do
      is_expected.to eql [
        Compass::NORTH,
        Compass::EAST,
        Compass::SOUTH,
        Compass::WEST
      ]
    end
  end

  context Point do
    it "'s origin is (0, 0)" do
      # noinspection RubyResolve
      expect(described_class.origin.to_s).to be_identical_to_string '[0, 0]'
    end

    it 'catches invalid dirs' do
      expect { described_class.origin.move '' }.to raise_exception ParseError
    end
  end

  context ParseError do
    it 'catches invalid inputs' do
      expect { 'X0, '.parse_commands }.to raise_exception described_class
    end

    it 'catches invalid directions' do
      expect { 'X'.parse_dir }.to raise_exception described_class
    end
  end

  context 'examples and stars' do
    subject { Traveller }

    it 'passes example 1' do
      expect(Traveller.endpoints_distance 'R2, L3').to be 5
    end

    it 'passes example 2' do
      expect(Traveller.endpoints_distance 'R2, R2, R2').to be 2
    end

    it 'passes example 3' do
      expect(Traveller.endpoints_distance 'R5, L5, R5, R3').to be 12
    end

    it 'anchieves star 1' do
      skip_this_when_dced do
        expect(Traveller.endpoints_distance input).to eql problem.answer 1
      end
    end

    it 'passes example 4' do
      expect(Traveller.twice_visited_points_distance 'R8, R4, R4, R8').to be 4
    end

    it 'anchieves star 2' do
      skip_this_when_dced do
        expect(Traveller.twice_visited_points_distance input).to eql problem.answer 2
      end
    end
  end
end