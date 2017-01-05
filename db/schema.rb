# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.
ActiveRecord::Schema.define(version: 20170104064243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  # noinspection RailsParamDefResolve
  create_table 'advent_problems', force: :cascade do |t|
    t.integer 'year', null: false
    t.integer 'day', null: false
    t.text 'input'
    t.binary 'answers'
    t.index %w(year day), name: 'index_advent_problems_on_year_and_day', unique: true, using: :btree
  end
end