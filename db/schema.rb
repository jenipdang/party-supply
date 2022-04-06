# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_06_004630) do
  create_table "expenses", force: :cascade do |t|
    t.integer "party_id", null: false
    t.integer "supply_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_expenses_on_party_id"
    t.index ["supply_id"], name: "index_expenses_on_supply_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "datetime"
    t.string "guest_list"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "parties"
  add_foreign_key "expenses", "supplies"
end
