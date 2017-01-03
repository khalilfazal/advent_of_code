class RenameInputsToAdventProblems < ActiveRecord::Migration[5.1]
  def change
    rename_table :inputs, :advent_problems
  end
end