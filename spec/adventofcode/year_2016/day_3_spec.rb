require_all 'lib/adventofcode/year_2016/day_3/*'

describe 'Year_2016::Day_3' do
  before(:all) do
    @input = Day_3.get_input
  end

  it '1' do
    expect(Triangle.validate_by_rows @input).to be == 869
  end

  it '2' do
    expect(Triangle.validate_by_columns @input).to be == 1544
  end
end