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

ActiveRecord::Schema.define(version: 2022_08_31_171151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.decimal "duration"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contracts_on_company_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "date_from"
    t.datetime "date_end"
    t.bigint "user_id"
    t.bigint "turn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turn_id"], name: "index_registrations_on_turn_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "turns", force: :cascade do |t|
    t.json "period"
    t.integer "week"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_turns_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name", null: false
    t.string "color", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contracts", "companies"
  add_foreign_key "registrations", "turns"
  add_foreign_key "registrations", "users"
  add_foreign_key "turns", "contracts"
end
