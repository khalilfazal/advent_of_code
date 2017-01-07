autoload :DateValidator, 'models/date_validator'

require 'msgpack'

# Stores an advent problem's date, input and answer
class AdventProblem < ActiveRecord::Base
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

  # Seed the database with +answers+
  #
  # @param year Integer
  # @param day Integer
  # @param answers [Integer | String]
  #
  # @return AdventProblem
  scope :seed, ->(year:, day:, answers:) do
    find_or_create_by!(year: year, day: day).tap do |problem|
      problem.update answers: answers.to_msgpack
    end
  end

  # Get the expected answer for the problem
  #
  # @param id Integer
  #
  # @return Integer | String
  def answer(id)
    # noinspection RubyResolve
    MessagePack.unpack(answers)[id - 1]
  end
end