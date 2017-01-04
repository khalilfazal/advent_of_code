# rename column answers to solutions
class RenameColumnAnswersToSolutions < ActiveRecord::Migration[5.1]
  def change
    rename_column :advent_problems, :answers, :solutions
  end
end
