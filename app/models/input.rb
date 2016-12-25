require 'active_record'

# noinspection RailsParamDefResolve
class Input < ActiveRecord::Base
  validates :year, numericality: {only_integer: true}
  current_year = Time::now.year
  validates :year, inclusion: {in: 2015 .. current_year, message: "The day must be between 1 and #{current_year}"}

  validates :day, numericality: {only_integer: true}
  validates :day, inclusion: {in: 1 .. 25, message: 'The day must be between 1 and 25'}

  validates_uniqueness_of :year, scope: :day
end