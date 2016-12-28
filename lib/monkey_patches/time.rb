require 'helpers/boolean'
require 'monkey_patches/comparable'

class Time
  # Returns a range of years that have Advent of Code problems
  #
  # @return Range<Integer>
  def advent_years
    2015 .. year - (month < 12 ? 1 : 0)
  end

  # returns 1 .. 25 if we are not in december
  # else returns 1 .. day cutting off at 25
  #
  # @return Range<Integer>
  def advent_days(year)
    if year === self.year
      1 .. (month < 12 ? 25 : day.clamp(1, 25))
    else
      1 .. 25
    end
  end

  # Has this year/day happened yet?
  #
  # @param year Integer
  # @param day Integer
  #
  # @return Boolean
  def valid_day?(year:, day:)
    advent_days(year).include? day
  end

  # Are there Advent of Code problems for this year?
  #
  # @param year Integer
  #
  # @return Boolean
  def valid_year?(year:)
    advent_years.include? year
  end
end