# change the default value of the input column to be null
class InputDefaultNull < ActiveRecord::Migration[5.1]
  change_table :advent_problems do |t|
    t.change :input, :text, default: nil
  end
end