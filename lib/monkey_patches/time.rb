autoload :Boolean, 'helpers/boolean'

# Calculates valid advent days and years
class Time
  # Gets a range of valid advent years
  #
  # @return Range of Integer
  def advent_years
    2015 .. year - (month < 12 ? 1 : 0)
  end

  # Gets a range of valid advent days for the specified year
  #
  # @param year Integer
  #
  # @return Range of Integer
  def advent_days(year:)
    1 .. (year.eql?(self.year) && month.eql?(12) ? day.clamp(1, 25) : 25)
  end

  # Are there any problems for this +date+?
  #
  # @param date Hash[Symbol, Integer]
  #
  # @return Boolean
  def valid_advent_date?(date)
    valid_advent_year?(date.slice :year) && valid_advent_day?(date)
  end

  private

  # Has year-12-day happened yet and are there any problems for this +day+?
  #
  # @param year Integer
  # @param day Integer
  #
  # @return Boolean
  def valid_advent_day?(year:, day:)
    advent_days(year: year).include? day
  end

  # Are there any problems for the specified +year+?
  #
  # @param year Integer
  #
  # @return Boolean
  def valid_advent_year?(year:)
    advent_years.include? year
  end
end