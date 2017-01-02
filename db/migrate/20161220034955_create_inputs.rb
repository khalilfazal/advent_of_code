# create table: inputs
# with columns: year, day, and input
class CreateInputs < ActiveRecord::Migration[5.0]
  def change
    create_table :inputs do |t|
      t.integer :year
      t.integer :day
      t.text :input
    end
  end
end
