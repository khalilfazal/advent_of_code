require 'active_record'
require 'monkey_patches/time'

# noinspection RailsParamDefResolve
class Input < ActiveRecord::Base
  validates :year, numericality: {only_integer: true}
  year_range = Time::now.advent_years
  validates :year, inclusion: {in: year_range, message: "The year must be between 2015 and #{year_range.last}"}

  validates :day, numericality: {only_integer: true}
  validates :day, inclusion: {in: 1 .. 25, message: 'The day must be between 1 and 25'}

  validates_uniqueness_of :year, scope: :day
end