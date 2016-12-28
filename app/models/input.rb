require 'active_record'
require 'monkey_patches/time'

# noinspection RailsParamDefResolve
class Input < ActiveRecord::Base
  validates_numericality_of :year, only_integer: true, strict: true, message: 'Years can only be integers'
  validates_numericality_of :day, only_integer: true, strict: true, message: 'Days can only be integers'
  validates_uniqueness_of :day, scope: :year, strict: true, message: 'Each day happens only once per year'

  validate :date

  def date
    now = Time::now

    unless now.valid_year?(year: year)
      errors.add(:year, :invalid_year, strict: true, message: 'There are no Advent of Code problems for %{year}')
    end

    unless now.valid_day?(year: year, day: day)
      errors.add(:day, :invalid_day, strict: true, message: "#{year}-12-#{day} hasn't occured yet")
    end
  end
end