class Date
  def self.current_advent_date
    today = Date::today

    if today.month === 12
      if today.day < 26
        today
      else
        today.prev_day (today.day - 25)
      end
    else
      Date.new (today.year - 1), 12, 25
    end
  end
end