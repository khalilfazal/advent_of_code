describe 'AdventOfCode' do
  it 'AdventOfCode is accessable' do
    expect do
      AdventOfCode
    end.not_to raise_error
  end

  it 'private @@cookie' do
    expect do
      AdventOfCode::COOKIE
    end.to raise_exception NameError
  end

  it 'private ::cookie' do
    expect do
      AdventOfCode::COOKIE
    end.to raise_exception NameError
  end
end