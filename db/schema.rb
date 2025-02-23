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

ActiveRecord::Schema.define(version: 2021_03_04_205716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep", limit: 8
    t.string "street"
    t.string "state", limit: 2
    t.string "city"
    t.string "number"
    t.string "complement"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cnpj", limit: 14
    t.text "phones", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnpj"], name: "index_clients_on_cnpj"
  end

  create_table "credits", force: :cascade do |t|
    t.integer "amount"
    t.integer "installments"
    t.float "interest"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_credits_on_client_id"
  end

  create_table "installments", force: :cascade do |t|
    t.integer "parcel"
    t.integer "amount"
    t.integer "status", default: 0
    t.date "due_date"
    t.bigint "credit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_id"], name: "index_installments_on_credit_id"
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "credits", "clients"
  add_foreign_key "installments", "credits"
end
