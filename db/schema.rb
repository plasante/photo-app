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

ActiveRecord::Schema.define(version: 20170819150928) do

  create_table "addresses", force: :cascade do |t|
    t.string   "number"
    t.string   "street"
    t.string   "zip"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id"
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "list_categories", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "category_id"
    t.integer  "description_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "list_categories", ["category_id"], name: "index_list_categories_on_category_id"
  add_index "list_categories", ["description_id"], name: "index_list_categories_on_description_id"
  add_index "list_categories", ["list_id"], name: "index_list_categories_on_list_id"

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "products", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "price"
    t.string   "format"
    t.integer  "unit_price"
    t.boolean  "diabetic"
    t.integer  "category_id"
    t.integer  "store_id"
    t.integer  "description_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["description_id"], name: "index_products_on_description_id"
  add_index "products", ["provider_id"], name: "index_products_on_provider_id"
  add_index "products", ["store_id"], name: "index_products_on_store_id"

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stores", ["address_id"], name: "index_stores_on_address_id"

  create_table "sub_categories", force: :cascade do |t|
    t.string   "sous_category"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "subscribed",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
