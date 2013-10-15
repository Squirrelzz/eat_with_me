# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131015032658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "characters", force: true do |t|
    t.string "name",      null: false
    t.string "image_url"
  end

  create_table "feeds", force: true do |t|
    t.integer  "pet_id"
    t.integer  "meals_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["meals_person_id"], name: "index_feeds_on_meals_person_id", using: :btree
  add_index "feeds", ["pet_id"], name: "index_feeds_on_pet_id", using: :btree

  create_table "meals", force: true do |t|
    t.string  "name"
    t.string  "qualification"
    t.integer "points"
    t.string  "image_url"
  end

  create_table "meals_people", force: true do |t|
    t.integer "meal_id"
    t.integer "person_id"
  end

  add_index "meals_people", ["meal_id"], name: "index_meals_people_on_meal_id", using: :btree
  add_index "meals_people", ["person_id"], name: "index_meals_people_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "pets", force: true do |t|
    t.string  "name",         null: false
    t.string  "sex",          null: false
    t.integer "character_id", null: false
    t.integer "person_id",    null: false
  end

  add_index "pets", ["character_id"], name: "index_pets_on_character_id", using: :btree
  add_index "pets", ["person_id"], name: "index_pets_on_person_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
