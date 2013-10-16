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

ActiveRecord::Schema.define(version: 20131013143401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string "name",      null: false
    t.string "image_url"
  end

  create_table "children_items", force: true do |t|
    t.integer "item_id"
    t.integer "user_id"
  end

  add_index "children_items", ["item_id"], name: "index_children_items_on_item_id", using: :btree
  add_index "children_items", ["user_id"], name: "index_children_items_on_user_id", using: :btree

  create_table "items", force: true do |t|
    t.string  "name"
    t.string  "qualification"
    t.integer "points"
    t.string  "image_url"
  end

  create_table "items_pets", force: true do |t|
    t.integer  "pet_id"
    t.integer  "children_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items_pets", ["children_item_id"], name: "index_items_pets_on_children_item_id", using: :btree
  add_index "items_pets", ["pet_id"], name: "index_items_pets_on_pet_id", using: :btree

  create_table "pets", force: true do |t|
    t.string  "name",         null: false
    t.string  "sex",          null: false
    t.integer "character_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "pets", ["character_id"], name: "index_pets_on_character_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

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
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["parent_id"], name: "index_users_on_parent_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
