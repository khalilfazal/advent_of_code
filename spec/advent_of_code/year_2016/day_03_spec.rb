require_all 'lib/advent_of_code/year_2016/day_03/*'

require 'advent_of_code'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day3 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input }

  context 'examples and stars' do
    it 'anchieves star 1' do
      skip_this_when_dced do
        expect(Triangle.num_of_triangles_as_rows input).to be == problem.answer(1)
      end
    end

    it 'anchieves star 2' do
      skip_this_when_dced do
        expect(Triangle.num_of_triangles_as_columns input).to be == problem.answer(2)
      end
    end
  end
end