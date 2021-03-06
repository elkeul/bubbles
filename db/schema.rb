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

ActiveRecord::Schema.define(version: 20170809150213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dive_types", force: :cascade do |t|
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity"], name: "index_dive_types_on_activity", unique: true
  end

  create_table "dive_types_dives", id: false, force: :cascade do |t|
    t.bigint "dive_type_id", null: false
    t.bigint "dive_id", null: false
  end

  create_table "divers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "certification", default: 0
    t.boolean "metric", default: true
    t.integer "last_dive_number", default: 0
    t.integer "total_bottom_time", default: 0
    t.index ["email"], name: "index_divers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_divers_on_reset_password_token", unique: true
  end

  create_table "dives", force: :cascade do |t|
    t.integer "dive_number"
    t.date "dive_date"
    t.string "location"
    t.decimal "latitude", precision: 5, scale: 2
    t.decimal "longitude", precision: 5, scale: 2
    t.time "time_in"
    t.time "time_out"
    t.integer "depth"
    t.integer "safety_stop_minutes"
    t.integer "pressure_in"
    t.integer "pressure_out"
    t.integer "temperature_air"
    t.integer "temperature_water"
    t.string "buddies"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "diver_id"
    t.integer "bottom_time", default: 0
    t.index ["diver_id"], name: "index_dives_on_diver_id"
  end

  add_foreign_key "dives", "divers"
end
