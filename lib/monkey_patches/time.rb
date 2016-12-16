class Time
  def advent_day
    if month == 12 && day < 26
      day
    else
      25
    end
  end
end