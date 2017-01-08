autoload :DateValidator, 'models/date_validator'

require 'msgpack'

# Stores an advent problem's date, input and answers
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
    message: '%{year}-12-%{day} is already in the table of problems'
  }

  # Seed the database with +answers+
  # which is stored as a variable-length binary string via MessagePack
  #
  # Example:
  #
  #   AdventProblem.seed year: 2016, day: 1, answers: [1, 2]
  #   # => AdventProblem(year: 2016, day: 1, answers: "\x92\x01\x02")
  #
  # @param year Integer
  # @param day Integer
  # @param answers [Integer | String]
  #
  # @return AdventProblem
  scope :seed, lambda { |year:, day:, answers:|
    find_or_create_by!(year: year, day: day).tap do |problem|
      problem.update answers: answers.to_msgpack
    end
  }

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