require 'monkey_patches/time'
require 'msgpack'

# noinspection RailsParamDefResolve
class AdventProblem < ActiveRecord::Base
  %i(year day).each do |attr|
    validates_presence_of attr, presence: true, strict: true, message: 'must be present'
    validates_numericality_of attr, only_integer: true, strict: true, message: 'can only be integral'
  end

  validate :advent_day
  validates_uniqueness_of :day, scope: :year, strict: true, message: '%{year}-12-%{day} is already in the input table'

  # seed the database with +answers+
  #
  # @param year Integer
  # @param day Integer
  # @param answers [Integer | String]
  #
  # @return AdventProblem
  def self.seed(year:, day:, answers:)
    find_or_create_by!(year: year, day: day).tap do |problem|
      problem.update answers: answers.to_msgpack
    end
  end

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
    MessagePack.unpack(answers)[id - 1]
  end
end