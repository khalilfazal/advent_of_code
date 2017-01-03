require 'advent_of_code'
require_all 'lib/advent_of_code/year_2016/day_03/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day3 do
  let(:input) { @input ||= described_class.input }

  context 'examples and stars' do
    subject { Triangle }

    it 'anchieves star 1' do
      skip_this_when_dced { expect(subject.num_of_triangles_as_rows input).to be == 869 }
    end

    it 'anchieves star 2' do
      skip_this_when_dced { expect(subject.num_of_triangles_as_columns input).to be == 1544 }
    end
  end
end