require 'models/load_db'
require 'monkey_patches/time'

# noinspection RailsParamDefResolve
class Input < ActiveRecord::Base
  %i(year day).each do |attr|
    validates_presence_of attr, presence: true, strict: true, message: 'must be present'
    validates_numericality_of attr, only_integer: true, strict: true, message: 'can only be integral'
  end

  validate :date

  def date
    now = Time::now

    validates_inclusion_of :year, in: now.advent_years, strict: true, message: 'There are no Advent of Code problems for %{year}'
    validates_inclusion_of :day, in: now.advent_days(year: year), strict: true, message: "#{year}-12-#{day} hasn't occured yet"
  end

  validates_uniqueness_of :day, scope: :year, strict: true, message: 'Each day happens only once per year'
end