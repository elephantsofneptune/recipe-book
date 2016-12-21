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

ActiveRecord::Schema.define(version: 20161221093543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cookbooks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cookbooks_on_user_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "cookbook_id"
    t.string   "title"
    t.text     "ingredients", default: [],              array: true
    t.text     "steps",       default: [],              array: true
    t.integer  "view_count"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["cookbook_id"], name: "index_recipes_on_cookbook_id", using: :btree
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.text     "description"
    t.string   "type_of_cook"
    t.boolean  "public"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "access_level",          default: 0
  end

  add_foreign_key "cookbooks", "users"
  add_foreign_key "recipes", "cookbooks"
  add_foreign_key "searches", "users"
end
