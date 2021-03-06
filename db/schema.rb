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

ActiveRecord::Schema.define(version: 2020_02_08_164037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addresable_type"
    t.bigint "addresable_id"
    t.string "street"
    t.integer "street_number"
    t.string "block"
    t.string "zone"
    t.string "city"
    t.string "province"
    t.string "cp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addresable_type", "addresable_id"], name: "index_addresses_on_addresable_type_and_addresable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_offices", force: :cascade do |t|
    t.string "stock_size"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumible_products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.string "detail"
    t.bigint "sub_category_id"
    t.bigint "producer_id"
    t.date "received_at"
    t.integer "code"
    t.string "status"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_consumible_products_on_producer_id"
    t.index ["sub_category_id"], name: "index_consumible_products_on_sub_category_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "delivery_date"
    t.string "delivery_status"
    t.bigint "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_deliveries_on_driver_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_logs", force: :cascade do |t|
    t.string "loggable_type"
    t.bigint "loggable_id"
    t.bigint "user_id"
    t.bigint "detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_id"], name: "index_history_logs_on_detail_id"
    t.index ["loggable_type", "loggable_id"], name: "index_history_logs_on_loggable_type_and_loggable_id"
    t.index ["user_id"], name: "index_history_logs_on_user_id"
  end

  create_table "invoice_products", force: :cascade do |t|
    t.string "product"
    t.string "amount"
    t.bigint "invoice_id"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_products_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "company_office_id"
    t.string "invoice_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_office_id"], name: "index_invoices_on_company_office_id"
  end

  create_table "machine_products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "available_amount"
    t.bigint "sub_category_id"
    t.string "code"
    t.string "status"
    t.string "product_version_type"
    t.integer "price"
    t.string "unit_type"
    t.bigint "producer_id"
    t.date "received_at"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_id"], name: "index_machine_products_on_producer_id"
    t.index ["sub_category_id"], name: "index_machine_products_on_sub_category_id"
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "producer_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "main_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_category_id"], name: "index_sub_categories_on_main_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fname"
    t.string "lname"
    t.integer "permission_level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consumible_products", "producers"
  add_foreign_key "consumible_products", "sub_categories"
  add_foreign_key "deliveries", "drivers"
  add_foreign_key "invoice_products", "invoices"
  add_foreign_key "invoices", "company_offices"
  add_foreign_key "machine_products", "producers"
  add_foreign_key "machine_products", "sub_categories"
  add_foreign_key "sub_categories", "main_categories"
end
