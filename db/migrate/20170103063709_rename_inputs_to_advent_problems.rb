# rename table inputs to advent_problems
class RenameInputsToAdventProblems < ActiveRecord::Migration[5.1]
  def change
    # noinspection RailsParamDefResolve
    rename_table :inputs, :advent_problems
  end
end