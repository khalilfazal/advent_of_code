describe 'AdventOfCode' do
  subject { AdventOfCode }

  it { within_block_is_expected.not_to raise_exception }

  it "'s @@cookie is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end

  it "'s ::cookie method is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end

  context '404 Exceptions for an invalid year/day' do
    it 'throws a 404 Exception when year is negative' do
      expect { subject.input year: -1, day: 1 }.to raise_exception OpenURI::HTTPError
    end

    it 'throws a 404 Exception when year < 2015' do
      expect { subject.input year: 2014, day: 1 }.to raise_exception OpenURI::HTTPError
    end

    it 'throws a 404 Exception when day is negative' do
      expect { subject.input year: 2015, day: -1 }.to raise_exception OpenURI::HTTPError
    end

    it 'throws a 404 Exception when day is 0' do
      expect { subject.input year: 2015, day: 0 }.to raise_exception OpenURI::HTTPError
    end

    it 'throws a 404 Exception when day is > 25' do
      expect { subject.input year: 2015, day: 26 }.to raise_exception OpenURI::HTTPError
    end
  end
end