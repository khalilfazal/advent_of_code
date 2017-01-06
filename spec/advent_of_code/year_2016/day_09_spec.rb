require_all 'lib/advent_of_code/year_2016/day_09/*'

require 'advent_of_code'
require 'helpers/match_string'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day9 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input.delete "\n" }

  context 'examples and stars' do
    [{
      compressed: 'ADVENT',
      decompressed: 'ADVENT'
    }, {
      compressed: 'A(1x5)BC',
      decompressed: 'ABBBBBC'
    }, {
      compressed: '(3x3)XYZ',
      decompressed: 'XYZXYZXYZ'
    }, {
      compressed: 'A(2x2)BCD(2x2)EFG',
      decompressed: 'ABCBCDEFEFG'
    }, {
      compressed: '(6x1)(1x3)A',
      decompressed: '(1x3)A'
    }, {
      compressed: 'X(8x2)(3x3)ABCY',
      decompressed: 'X(3x3)ABC(3x3)ABCY'
    }].each_with_index do |example, i|
      it "example #{i + 1}" do
        file = Day9::File.new example[:compressed]

        # noinspection RubyResolve
        expect(file.decompress).to be_identical_to_string example[:decompressed]
        expect(file.length).to be === example[:decompressed].length
      end
    end

    it 'achieves star 1' do
      skip_this_when_dced do
        expect(Day9::File.new(input).decompress.length).to be === problem.solution(1)
      end
    end

    it 'achieves star 2' do
      skip_this_when_dced do
        expect(Day9::File.decompressed_length input).to be === problem.solution(2)
      end
    end
  end
end