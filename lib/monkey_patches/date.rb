require 'date'

class Date
  def self.current_advent_date
    self.today.instance_eval do
      if month === 12
        if day < 25
          self
        else
          prev_day (day - 25)
        end
      else
        new (year - 1), 12, 25
      end
    end
  end
end