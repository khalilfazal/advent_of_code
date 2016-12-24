require_all 'lib/advent_of_code/year_2016/day_1/*'

describe Year2016::Day1 do
  let (:input) { @input ||= described_class::input }

  context Compass do
    subject { Compass::NORTH }

    it "'s @clockwise neighbour is Compass::WEST" do
      expect(subject.clockwise).to equal Compass::WEST
    end

    it "'s #neighbours= is private" do
      expect { subject.neighbours = Compass::WEST, Compass::EAST }.to raise_exception NoMethodError
    end

    it 'can #cycle once around @clockwise' do
      expect(subject.cycle).to be === [
          Compass::NORTH,
          Compass::EAST,
          Compass::SOUTH,
          Compass::WEST
      ]
    end
  end

  context Point do
    it "'s origin is (0, 0)" do
      expect(described_class.origin.dims).to be === [0, 0]
    end

    it 'catches invalid dirs' do
      expect { described_class.origin.move '' }.to raise_exception Compass::InvalidDirection
    end
  end

  context AdventOfCode::InputError do
    it 'catches invalid inputs' do
      expect { 'X0, '.parse_path }.to raise_exception described_class
    end

    it 'catches invalid directions' do
      expect { 'X'.parse_dir }.to raise_exception described_class
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
      skip_this_on_network_error { expect(subject.endpoints_distance input).to be === 236 }
    end

    it 'passes example 4' do
      expect(subject.twice_visited_points_distance 'R8, R4, R4, R8').to be === 4
    end

    it 'anchieves star 2' do
      skip_this_on_network_error { expect(subject.twice_visited_points_distance input).to be === 182 }
    end
  end
end