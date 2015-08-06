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

ActiveRecord::Schema.define(version: 20150806080915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_function"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_zip"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.string   "phone"
  end

  create_table "product_refs", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "size"
    t.string   "sku_name"
    t.integer  "inventory_quantity_cabine"
    t.string   "inventory_type"
    t.string   "inventory_brand_availability"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "gender"
    t.string   "name"
    t.string   "availability"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "brand_id"
    t.string   "category"
    t.decimal  "purchase_price_ht"
    t.decimal  "gross_sell_price_ht"
    t.decimal  "vat_rate"
    t.decimal  "promotion_percentage"
  end

  create_table "supplies", force: :cascade do |t|
    t.integer  "brand_id"
    t.date     "order_date"
    t.date     "expected_reception_date"
    t.string   "status"
    t.date     "reception_date"
    t.text     "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "supply_batch_items", force: :cascade do |t|
    t.integer  "supply_batch_id"
    t.integer  "expected_quantity"
    t.integer  "received_quantity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "size"
    t.string   "sku_name"
    t.integer  "product_ref_id"
  end

  create_table "supply_batches", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "supply_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
