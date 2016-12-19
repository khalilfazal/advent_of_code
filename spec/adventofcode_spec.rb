describe 'Adventofcode' do
  it 'private cookie' do
    expect do
      Adventofcode::COOKIE
    end.to raise_exception NameError
  end
end