require_all 'lib/advent_of_code/year_2016/day_03/*'

require 'advent_of_code'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day3 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input }

  context 'examples and stars' do
    subject { Triangle }

    it 'anchieves star 1' do
      skip_this_when_dced do
        expect(subject.num_of_triangles_as_rows input).to be == 869
      end
    end

    it 'anchieves star 2' do
      skip_this_when_dced do
        expect(subject.num_of_triangles_as_columns input).to be == 1544
      end
    end
  end
end