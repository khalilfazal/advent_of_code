class Time
  def advent_years
    2015 .. year - (month < 12 ? 1 : 0)
  end

  def advent_days
    1 .. (month < 12 ? 25 : day.clamp(1, 25))
  end
end