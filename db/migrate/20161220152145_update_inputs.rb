# add index to prevent duplicate advent days in a year
class UpdateInputs < ActiveRecord::Migration[5.0]
  def change
    change_table :inputs do |t|
      t.change :year, :integer, null: false
      t.change :day, :integer, null: false
      t.change :input, :text, default: ''
    end

    # noinspection RailsParamDefResolve
    add_index :inputs, %i(year day), unique: true
  end
end