describe 'AdventOfCode' do
  it 'private cookie' do
    expect do
      AdventOfCode::COOKIE
    end.to raise_exception NameError
  end
end