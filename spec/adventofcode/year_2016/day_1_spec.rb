require_all 'lib/adventofcode/year_2016/day_1/*'
require 'monkey_patches/pending'

describe 'Year_2016::Day_1' do
  it 'left north' do
    expect(Compass::NORTH.left).to equal(Compass::WEST)
  end

  it 'private set neighbours' do
    expect do
      Compass::NORTH.set_neighbours Compass::WEST, Compass::EAST
    end.to raise_exception NoMethodError
  end

  it 'cycle from' do
    expect(Compass::NORTH.cycle_from).to be === [Compass::NORTH,
        Compass::EAST,
        Compass::SOUTH,
        Compass::WEST
    ]
  end

  it 'origin' do
    expect(Point.origin.x).to equal(0)
    expect(Point.origin.y).to equal(0)
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
      expect(Traveller.endpoint_distance).to be === 236
    end
  end

  it 'example 4' do
    expect(Traveller.twice_visited_distance 'R8, R4, R4, R8').to be === 4
  end

  it 'star 2' do
    skip_when_dced do
      expect(Traveller.twice_visited_distance).to be === 182
    end
  end
end