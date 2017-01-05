# add a column for answers.
# represented as a binary string
class CreateAnswersColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :advent_problems, :answers, :binary
  end
end