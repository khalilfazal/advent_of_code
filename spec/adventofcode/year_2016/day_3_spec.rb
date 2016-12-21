require_all 'lib/adventofcode/year_2016/day_3/*'
require 'helpers/cache_input'
require 'helpers/skip'

describe 'Year2016::Day3' do
  before :all do
    cache_input
  end

  it 'star 1' do
    skip_when_dced do
      expect(Triangle.validate_by_rows @input).to be == 869
    end
  end

  it 'star 2' do
    skip_when_dced do
      expect(Triangle.validate_by_columns @input).to be == 1544
    end
  end
end