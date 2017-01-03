require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_09/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day9 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input.delete "\n" }

  context 'examples and stars' do
    [{
      compressed: 'ADVENT',
      decompressed: 'ADVENT',
      length: 6
    }, {
      compressed: 'A(1x5)BC',
      decompressed: 'ABBBBBC',
      length: 7
    }, {
      compressed: '(3x3)XYZ',
      decompressed: 'XYZXYZXYZ',
      length: 9
    }, {
      compressed: 'A(2x2)BCD(2x2)EFG',
      decompressed: 'ABCBCDEFEFG',
      length: 11
    }, {
      compressed: '(6x1)(1x3)A',
      decompressed: '(1x3)A',
      length: 6
    }, {
      compressed: 'X(8x2)(3x3)ABCY',
      decompressed: 'X(3x3)ABC(3x3)ABCY',
      length: 18
    }].each_with_index do |example, i|
      it "example #{i + 1}" do
        file = Day9::File.new example[:compressed]

        # noinspection RubyResolve
        expect(file.decompress).to be_identical_to_string example[:decompressed]
        expect(file.length).to be === example[:length]
      end
    end

    it 'achieves star 1' do
      expect(Day9::File.new(input).decompress.length).to be === 110_346
    end

    it 'achieves star 2' do
      expect(Day9::File.decompressed_length input).to be === 10_774_309_173
    end
  end
end