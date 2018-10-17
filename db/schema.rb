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

ActiveRecord::Schema.define(version: 2018_10_17_202902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_list_items", force: :cascade do |t|
    t.bigint "project_line_item_id"
    t.text "title"
    t.boolean "completed", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_line_item_id"], name: "index_check_list_items_on_project_line_item_id"
    t.index ["user_id"], name: "index_check_list_items_on_user_id"
  end

  create_table "project_line_items", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["project_id"], name: "index_project_line_items_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "main_objective"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.text "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "check_list_items", "project_line_items"
  add_foreign_key "check_list_items", "users"
  add_foreign_key "project_line_items", "projects"
  add_foreign_key "projects", "users"
end
