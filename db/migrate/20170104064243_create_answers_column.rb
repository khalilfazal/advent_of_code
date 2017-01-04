# add a column for answers.
# represented as an array of strings
# store each answer with Object#inspect
class CreateAnswersColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :advent_problems, :answers, :text, array: true, default: []
  end
end