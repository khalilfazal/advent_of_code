autoload :Boolean, 'helpers/boolean'

# Calculates valid advent days and years
class Time
  # Gets a range of valid advent years
  #
  # @return Range of Integer
  def advent_years
    min_year .. max_year
  end

  # Gets a range of valid advent days for the specified year
  #
  # @param year Integer
  #
  # @return Range of Integer
  def advent_days(year:)
    min_day .. max_day(year: year)
  end

  # Are there any problems for this +date+?
  #
  # @param date Hash[Symbol, Integer] {year:, day:} not +Date+ class
  #
  # @return Boolean
  def valid_advent_date?(date)
    valid_advent_year?(date.slice :year) && valid_advent_day?(date)
  end

  private

  # The first advent year
  #
  # @return Integer
  def min_year
    2015
  end

  # The most recent advent year
  #
  # @return Integer
  def max_year
    year - (month < 12 ? 1 : 0)
  end

  # Are there any problems for the specified +year+?
  #
  # @param year Integer
  #
  # @return Boolean
  def valid_advent_year?(year:)
    min_year <= year && year <= max_year
  end

  # The first day of December
  #
  # @return Integer
  def min_day
    1
  end

  # The most recent advent day for December of +year+
  #
  # @param year Integer
  #
  # @return Integer
  def max_day(year:)
    year.eql?(self.year) && month.eql?(12) ? day.clamp(1, 25) : 25
  end

  # Has year-12-day happened yet and are there any problems for this +day+?
  #
  # @param year Integer
  # @param day Integer
  #
  # @return Boolean
  def valid_advent_day?(year:, day:)
    min_day <= day && day <= max_day(year: year)
  end
end