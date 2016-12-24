

# published question asking how this works here: https://redd.it/5k126e
describe 'BasicObject' do
  def expect_singleton_to_work(subject)
    expect(subject.singleton).to be === [subject]
  end

  it "'s #singleton works for Integers'" do
    expect_singleton_to_work 1
  end

  it "'s #singleton works for Strings" do
    expect_singleton_to_work 'derp'
  end
end