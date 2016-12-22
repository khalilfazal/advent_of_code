describe 'AdventOfCode' do
  subject { AdventOfCode }

  it 'is accessable' do
    expect { subject }.not_to raise_error
  end

  it "'s @@cookie is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end

  it "'s ::cookie is private" do
    expect { subject::COOKIE }.to raise_exception NameError
  end
end