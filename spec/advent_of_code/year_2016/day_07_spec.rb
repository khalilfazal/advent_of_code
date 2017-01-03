require 'advent_of_code'
require_all 'lib/advent_of_code/year_2016/day_07/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day7 do
  let(:input) { @input ||= described_class.input.lines }

  let(:tls_examples) do
    %w(
      abba[mnop]qrst
      abcd[bddb]xyyx
      aaaa[qwer]tyui
      ioxxoj[asdfgh]zxcvbn
    )
  end

  let(:ssl_examples) do
    %w(
      aba[bab]xyz
      xyx[xyx]xyx
      aaa[kek]eke
      zazbz[bzb]cdb
    )
  end

  context 'examples and stars' do
    RSpec::Matchers.define :support do |protocol|
      match do |ip|
        expect(ip.send "#{protocol}?".to_sym).to be true
      end
    end

    it 'passes example 1' do
      expect(tls_examples[0]).to support :tls
    end

    it 'passes example 2' do
      expect(tls_examples[1]).not_to support :tls
    end

    it 'passes example 3' do
      expect(tls_examples[2]).not_to support :tls
    end

    it 'passes example 4' do
      expect(tls_examples[3]).to support :tls
    end

    it 'achieves star 1' do
      expect(input.count(&:tls?)).to be === 110
    end

    it 'passes example 5' do
      expect(ssl_examples[0]).to support :ssl
    end

    it 'passes example 6' do
      expect(ssl_examples[1]).not_to support :ssl
    end

    it 'passes example 7' do
      expect(ssl_examples[2]).to support :ssl
    end

    it 'passes example 8' do
      expect(ssl_examples[3]).to support :ssl
    end

    it 'achieves star 2' do
      expect(input.count(&:ssl?)).to be === 242
    end
  end
end