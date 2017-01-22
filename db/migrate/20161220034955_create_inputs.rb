# Create table: inputs
# with columns: year, day, and input
class CreateInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inputs do |t|
      t.integer :year, null: false
      t.integer :day, null: false
      t.text :input, default: ''
    end

    add_index :inputs, %i(year day), unique: true
  end
end