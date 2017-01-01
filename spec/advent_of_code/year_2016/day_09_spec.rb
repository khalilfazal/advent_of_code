require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_09/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day9 do
  let(:input) { @input ||= described_class::input.delete "\n" }

  it 'example 1' do
    file = Day9::File.new 'ADVENT'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string 'ADVENT'
    expect(file.length).to be === 6
  end

  it 'example 2' do
    file = Day9::File.new 'A(1x5)BC'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string 'ABBBBBC'
    expect(file.length).to be === 7
  end

  it 'example 3' do
    file = Day9::File.new '(3x3)XYZ'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string 'XYZXYZXYZ'
    expect(file.length).to be === 9
  end

  it 'example 4' do
    file = Day9::File.new 'A(2x2)BCD(2x2)EFG'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string 'ABCBCDEFEFG'
    expect(file.length).to be === 11
  end

  it 'example 5' do
    file = Day9::File.new '(6x1)(1x3)A'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string '(1x3)A'
    expect(file.length).to be === 6
  end

  it 'example 6' do
    file = Day9::File.new 'X(8x2)(3x3)ABCY'

    # noinspection RubyResolve
    expect(file.decompress).to be_identical_to_string 'X(3x3)ABC(3x3)ABCY'
    expect(file.length).to be === 18
  end

  it 'test 1' do
    expect( Day9::File.new(input).decompress.length).to be === 110_346
  end

  it 'test 2' do
    expect(Day9::File.decompressed_length input).to be === 10_774_309_173
  end
end