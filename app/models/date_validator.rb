require 'monkey_patches/time'

# Validates a date using Time#valid_advent_date?
class DateValidator < ActiveModel::Validator
  # Validates a record's date
  #
  # @param record AdventProblem
  #
  # @return NilClass
  def validate(record)
    date = record.slice(:year, :day).symbolize_keys
    message = "There are no Advent of Code problems for #{date[:year]}-12-#{date[:day]}."

    record.errors[:base] << message unless Time.current.valid_advent_date? date
  end
end