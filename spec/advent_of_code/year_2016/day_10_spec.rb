require_all 'lib/advent_of_code/year_2016/day_10/*'

require 'advent_of_code'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day10 do
  before :all do
    skip_this_when_dced do
      @problem = described_class.problem
    end

    @world = World.run @problem.input.lines
  end

  context World do
    it 'catches invalid commands' do
      expect { World.run ['noop'] }.to raise_error ParseError
    end
  end

  context 'examples and stars' do
    it 'achieves star 1' do
      expect(@world.bot_with_chips low: 17, high: 61).to eql @problem.answer 1
    end

    it 'achieves star 2' do
      expect(@world.output_product_of_chips 0 .. 2).to eql @problem.answer 2
    end
  end
end