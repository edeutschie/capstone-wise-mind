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

ActiveRecord::Schema.define(version: 20170706234556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quote_users", force: :cascade do |t|
    t.integer  "quote_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_quote_users_on_quote_id", using: :btree
    t.index ["user_id"], name: "index_quote_users_on_user_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "text"
    t.string   "author"
    t.string   "theme"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quotes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "phone_num"
    t.string   "email"
    t.string   "theme_choice"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
