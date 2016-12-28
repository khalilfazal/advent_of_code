require 'helpers/boolean'
require 'monkey_patches/comparable'

class Time
  # @return Range<Integer>
  def advent_years
    2015 .. year - (month < 12 ? 1 : 0)
  end

  # @param year Integer
  #
  # @return Range<Integer>
  def advent_days(year:)
    1 .. ((year === self.year && month === 12) ? day.clamp(1, 25) : 25)
  end

  # Has year-12-day happened yet?
  #
  # @param year Integer
  # @param day Integer
  #
  # @return Boolean
  def valid_advent_day?(year:, day:)
    advent_days(year: year).include? day
  end

  # Are there Advent of Code problems for this year?
  #
  # @param year Integer
  #
  # @return Boolean
  def valid_advent_year?(year:)
    advent_years.include? year
  end
end