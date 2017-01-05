autoload :JSON, 'json'
require 'monkey_patches/time'

# noinspection RailsParamDefResolve
class AdventProblem < ActiveRecord::Base
  %i(year day).each do |attr|
    validates_presence_of attr, presence: true, strict: true, message: 'must be present'
    validates_numericality_of attr, only_integer: true, strict: true, message: 'can only be integral'
  end

  validate :advent_day
  validates_uniqueness_of :day, scope: :year, strict: true, message: '%{year}-12-%{day} is already in the input table'

  # @return [ActiveModel::Validations::InclusionValidator]
  def advent_day
    now = Time.now

    validates_inclusion_of :year, in: now.advent_years, strict: true, message: 'There are no Advent of Code problems for %{year}'
    validates_inclusion_of :day, in: now.advent_days(year: year), strict: true, message: "#{year}-12-#{day} hasn't occured yet"
  end

  # @param id Integer
  #
  # @return Integer | String
  def solution(id)
    # noinspection RubyResolve
    JSON.parse answers[id - 1], quirks_mode: true
  end
end