require 'monkey_patches/time'
require 'msgpack'

# Stores an advent problem's date, input and answer
class AdventProblem < ActiveRecord::Base
  # Validates a date using Time#valid_advent_date?
  class DateValidator < ActiveModel::Validator
    # Validates a record's date
    #
    # @param record AdventProblem
    #
    # @return NilClass
    def validate(record)
      valid_date = Time.current.valid_advent_date? record.slice(:year, :day).symbolize_keys

      record.errors[:base] << "There are no Advent of Code problems for #{date[:year]}-12-#{date[:day]}." unless valid_date
    end
  end

  %i(year day).each do |attr|
    validates attr, presence: {
      strict: true,
      message: 'must be specified'
    }

    validates attr, numericality: {
      only_integer: true,
      strict: true,
      message: 'can only be integral'
    }
  end

  validates_with DateValidator, strict: true

  validates :day, uniqueness: {
    scope: :year,
    strict: true,
    message: '%{year}-12-%{day} is already in the input table'
  }

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

  # @param id Integer
  #
  # @return Integer | String
  def solution(id)
    # noinspection RubyResolve
    MessagePack.unpack(answers)[id - 1]
  end
end