# rename table inputs to advent_problems
class RenameInputsToAdventProblems < ActiveRecord::Migration[5.1]
  def change
    rename_table :inputs, :advent_problems
  end
end