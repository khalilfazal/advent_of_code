require_all 'lib/advent_of_code/year_2016/day_10/*'

# noinspection RubyResolve
describe Day10 do
  before :all do
    skip_this_when_dced do
      @problem = described_class.problem
    end

    @world = World.run @problem.input.lines
  end

  context World do
    subject { World }

    it 'catches invalid commands' do
      expect { subject.run ['noop'] }.to raise_error ParseError
    end
  end

  context 'examples and stars' do
    it 'achieves star 1' do
      expect(@world.bot_with_chips low: 17, high: 61).to be === 181
    end

    it 'achieves star 2' do
      expect(@world.output_products 0 .. 2).to be === 12_567
    end
  end
end