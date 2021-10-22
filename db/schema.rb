# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_22_043151) do

  create_table "checks", force: :cascade do |t|
    t.string "achieve"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["user_id"], name: "index_checks_on_user_id"
  end

  create_table "item_masters", force: :cascade do |t|
    t.string "path"
    t.integer "rare"
    t.string "name"
    t.string "explanation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "gacha"
  end

  create_table "missions", force: :cascade do |t|
    t.string "reward_type"
    t.string "reward"
    t.boolean "dayly"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "mixtunes", force: :cascade do |t|
    t.string "generation"
    t.string "material"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "point", default: 0
    t.string "nickname"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.float "taion"
    t.string "health"
    t.date "date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_temperatures_on_user_id"
  end

  create_table "user_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_master_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "num"
    t.index ["item_master_id"], name: "index_user_items_on_item_master_id"
    t.index ["user_id"], name: "index_user_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "checks", "users"
  add_foreign_key "missions", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "temperatures", "users"
  add_foreign_key "user_items", "item_masters"
  add_foreign_key "user_items", "users"
end
