require 'advent_of_code'

describe 'AdventOfCode' do
  subject { AdventOfCode }

  it 'is accessable' do
    expect { subject }.not_to raise_error
  end

  it "'s @@cookie is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end

  it "'s ::cookie method is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end

  it 'throws a 404 Exception for an invalid year/day' do
    expect { subject.input year: 0, day: 0 }.to raise_exception OpenURI::HTTPError
  end
end