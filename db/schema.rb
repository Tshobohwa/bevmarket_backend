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

ActiveRecord::Schema[7.1].define(version: 2024_08_29_055903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.boolean "is_partner", default: false, null: false
    t.float "credit", default: 0.0, null: false
    t.index ["phone_number"], name: "index_clients_on_phone_number", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.integer "user_id"
    t.text "reason"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "bottles_number"
    t.integer "capacity"
    t.string "capacity_unit"
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "stock_item_id"
    t.decimal "quantity"
    t.decimal "unit_sale_price"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
    t.index ["stock_item_id"], name: "index_sale_items_on_stock_item_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "user_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "stock_items", force: :cascade do |t|
    t.integer "item_id"
    t.decimal "quantity"
    t.decimal "last_unit_buy_price"
    t.decimal "reduction_sale_price"
    t.decimal "unit_sale_price"
    t.decimal "average_unit_buy_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_stock_items_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expenses", "users"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sale_items", "stock_items"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "users"
  add_foreign_key "stock_items", "items"
end
