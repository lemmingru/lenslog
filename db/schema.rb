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

ActiveRecord::Schema[7.1].define(version: 2024_01_08_075624) do
  create_table "lens_types", force: :cascade do |t|
    t.string "manufacturer"
    t.string "prescription"
    t.integer "wearing_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "status"
    t.index ["user_id"], name: "index_lens_types_on_user_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "status"
    t.float "usage_hours"
    t.integer "lens_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "last_usage_date"
    t.index ["lens_type_id"], name: "index_lenses_on_lens_type_id"
  end

  create_table "usages", force: :cascade do |t|
    t.integer "lens_id", null: false
    t.float "usage_hours"
    t.date "usage_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lens_id"], name: "index_usages_on_lens_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "lens_types", "users"
  add_foreign_key "lenses", "lens_types"
  add_foreign_key "usages", "lenses"
end
