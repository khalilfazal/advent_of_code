require_all 'lib/advent_of_code/year_2016/day_3/*'

describe 'Year2016::Day3' do
  let (:input) { @input ||= Day3::input }

  context 'examples and stars' do
    subject { Triangle }

    it 'star 1' do
      skip_this_on_network_error { expect(subject.num_of_triangles_as_rows input).to be == 869 }
    end

    it 'star 2' do
      skip_this_on_network_error { expect(subject.num_of_triangles_as_columns input).to be == 1544 }
    end
  end
end