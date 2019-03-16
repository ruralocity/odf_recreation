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

ActiveRecord::Schema.define(version: 2019_03_16_050736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.integer "computed_region"
    t.string "amenities"
    t.string "contact_number"
    t.string "description"
    t.bigint "district_id"
    t.float "latitude"
    t.float "longitude"
    t.string "number_of_sites"
    t.string "overnight_fee"
    t.string "season"
    t.bigint "state_forest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_opportunities_on_district_id"
    t.index ["state_forest_id"], name: "index_opportunities_on_state_forest_id"
  end

  create_table "opportunity_types", force: :cascade do |t|
    t.bigint "opportunity_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opportunity_id"], name: "index_opportunity_types_on_opportunity_id"
    t.index ["type_id"], name: "index_opportunity_types_on_type_id"
  end

  create_table "state_forests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "opportunities", "districts"
  add_foreign_key "opportunities", "state_forests"
  add_foreign_key "opportunity_types", "opportunities"
  add_foreign_key "opportunity_types", "types"
end
