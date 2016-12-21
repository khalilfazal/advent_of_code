require_all 'lib/adventofcode/year_2016/day_1/*'
require 'helpers/cache_input'
require 'helpers/skip'

describe 'Year2016::Day1' do
  before :all do
    cache_input
  end

  it 'left of north' do
    expect(Compass::NORTH.left).to equal(Compass::WEST)
  end

  it 'private set_neighbours' do
    expect do
      Compass::NORTH.set_neighbours Compass::WEST, Compass::EAST
    end.to raise_exception NoMethodError
  end

  it 'cycle_from' do
    expect(Compass::NORTH.cycle_from).to be === [Compass::NORTH,
        Compass::EAST,
        Compass::SOUTH,
        Compass::WEST
    ]
  end

  it 'origin' do
    expect(Point.origin.dims).to be === [0, 0]
  end

  it 'throws when direction is invalid' do
    expect do
      Point.origin.move ''
    end.to raise_exception Compass::InvalidDirection
  end

  it 'example 1' do
    expect(Traveller.endpoint_distance 'R2, L3').to be === 5
  end

  it 'example 2' do
    expect(Traveller.endpoint_distance 'R2, R2, R2').to be === 2
  end

  it 'example 3' do
    expect(Traveller.endpoint_distance 'R5, L5, R5, R3').to be === 12
  end

  it 'star 1' do
    skip_when_dced do
      expect(Traveller.endpoint_distance @input).to be === 236
    end
  end

  it 'example 4' do
    expect(Traveller.twice_visited_distance 'R8, R4, R4, R8').to be === 4
  end

  it 'star 2' do
    skip_when_dced do
      expect(Traveller.twice_visited_distance @input).to be === 182
    end
  end

  it 'throws when input is invalid' do
    expect do
      'X0, '.parse_path
    end.to raise_exception InputError
  end
end