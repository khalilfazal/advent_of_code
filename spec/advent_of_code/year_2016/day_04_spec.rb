require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_04/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day4 do
  let(:input) { @input ||= described_class.input.lines }
  let(:examples) do
    %w(
      aaaaa-bbb-z-y-x-123[abxyz]
      a-b-c-d-e-f-g-h-987[abcde]
      not-a-real-room-404[oarel]
      totally-real-room-200[decoy]
    )
  end

  context 'examples and stars' do
    subject { Room }

    RSpec::Matchers.define :be_a_real_room do
      match do |input|
        room = subject.new input

        # noinspection RubyResolve
        expect(room.calc_checksum).to be_identical_to_string room.checksum
      end
    end

    it 'example 1' do
      expect(examples[0]).to be_a_real_room
    end

    it 'example 2' do
      expect(examples[1]).to be_a_real_room
    end

    it 'example 3' do
      expect(examples[2]).to be_a_real_room
    end

    it 'example 4' do
      expect(examples[3]).not_to be_a_real_room
    end

    it 'example 5' do
      expect(subject.sum_of_real_sector_ids examples).to be === 1_514
    end

    it 'test 1' do
      expect(subject.sum_of_real_sector_ids input).to be === 361_724
    end

    it 'example 6' do
      # noinspection RubyResolve
      expect(subject.decrypt('qzmt-zixmtkozy-ivhz-343')).to be_identical_to_string 'very encrypted name'
    end

    it 'test 2' do
      expect(subject.find_sector_id_of(input, 'northpole object storage')).to be === 482
    end
  end
end