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

ActiveRecord::Schema[7.0].define(version: 19) do
  create_table "building_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "code"
    t.string "address"
    t.string "house_number"
    t.string "zip"
    t.string "city"
    t.string "province"
    t.bigint "landlord_id", null: false
    t.bigint "building_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_type_id"], name: "index_buildings_on_building_type_id"
    t.index ["landlord_id"], name: "index_buildings_on_landlord_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_cards", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlord_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "code"
    t.string "company_name"
    t.string "vat_number"
    t.string "fiscal_code"
    t.string "first_name"
    t.string "last_name"
    t.bigint "sex_id", null: false
    t.string "address"
    t.string "house_number"
    t.string "zip"
    t.string "city"
    t.string "province"
    t.string "phone"
    t.string "mobile"
    t.string "email"
    t.string "fulloperatorname"
    t.string "updater"
    t.bigint "landlord_type_id", null: false
    t.bigint "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_type_id"], name: "index_landlords_on_landlord_type_id"
    t.index ["operator_id"], name: "index_landlords_on_operator_id"
    t.index ["sex_id"], name: "index_landlords_on_sex_id"
  end

  create_table "occupations", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operators", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "institute"
    t.string "office"
    t.string "category"
    t.string "region"
    t.string "province"
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
    t.index ["username"], name: "index_operators_on_username", unique: true
  end

  create_table "privacy_firsts", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privacy_seconds", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privacy_thirds", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_sectors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_sectors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sexes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.date "subscription_date"
    t.string "code"
    t.string "fiscal_code"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "birth_place"
    t.bigint "sex_id", null: false
    t.string "nationality"
    t.string "citizenship"
    t.string "address"
    t.string "house_number"
    t.string "zip"
    t.string "city"
    t.string "province"
    t.string "phone"
    t.string "mobile"
    t.string "email"
    t.string "fulloperatorname"
    t.string "updater"
    t.bigint "category_id"
    t.bigint "delivery_card_id", null: false
    t.bigint "occupation_id"
    t.bigint "private_sector_id"
    t.bigint "public_sector_id"
    t.bigint "subscription_reason_id", null: false
    t.bigint "subscription_type_id", null: false
    t.bigint "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 8, scale: 2, default: "0.0"
    t.bigint "privacy_first_id"
    t.bigint "privacy_second_id"
    t.bigint "privacy_third_id"
    t.index ["category_id"], name: "index_subscribers_on_category_id"
    t.index ["delivery_card_id"], name: "index_subscribers_on_delivery_card_id"
    t.index ["occupation_id"], name: "index_subscribers_on_occupation_id"
    t.index ["operator_id"], name: "index_subscribers_on_operator_id"
    t.index ["privacy_first_id"], name: "index_subscribers_on_privacy_first_id"
    t.index ["privacy_second_id"], name: "index_subscribers_on_privacy_second_id"
    t.index ["privacy_third_id"], name: "index_subscribers_on_privacy_third_id"
    t.index ["private_sector_id"], name: "index_subscribers_on_private_sector_id"
    t.index ["public_sector_id"], name: "index_subscribers_on_public_sector_id"
    t.index ["sex_id"], name: "index_subscribers_on_sex_id"
    t.index ["subscription_reason_id"], name: "index_subscribers_on_subscription_reason_id"
    t.index ["subscription_type_id"], name: "index_subscribers_on_subscription_type_id"
  end

  create_table "subscription_reasons", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buildings", "building_types"
  add_foreign_key "buildings", "landlords"
  add_foreign_key "landlords", "landlord_types"
  add_foreign_key "landlords", "operators"
  add_foreign_key "landlords", "sexes"
  add_foreign_key "subscribers", "categories"
  add_foreign_key "subscribers", "delivery_cards"
  add_foreign_key "subscribers", "occupations"
  add_foreign_key "subscribers", "operators"
  add_foreign_key "subscribers", "privacy_firsts"
  add_foreign_key "subscribers", "privacy_seconds"
  add_foreign_key "subscribers", "privacy_thirds"
  add_foreign_key "subscribers", "private_sectors"
  add_foreign_key "subscribers", "public_sectors"
  add_foreign_key "subscribers", "sexes"
  add_foreign_key "subscribers", "subscription_reasons"
  add_foreign_key "subscribers", "subscription_types"
end
