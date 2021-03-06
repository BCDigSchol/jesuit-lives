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

ActiveRecord::Schema.define(version: 2021_05_25_151418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_type"
    t.string "document_id"
    t.string "document_type"
    t.binary "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_bookmarks_on_document_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

# Could not dump table "date_points" because of following StandardError
#   Unknown type 'precisions' for column 'precision'

  create_table "jesuits", force: :cascade do |t|
    t.string "jl_id", null: false
    t.bigint "title_id"
    t.string "last_name"
    t.string "first_name_abbrev"
    t.string "first_name"
    t.bigint "birth_date_id"
    t.bigint "place_of_birth_id"
    t.bigint "entrance_date_id"
    t.bigint "entrance_date_2_id"
    t.bigint "entrance_province_id"
    t.bigint "entrance_province_2_id"
    t.bigint "status_id"
    t.bigint "vow_date_id"
    t.bigint "death_date_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "place_of_death_id"
    t.integer "linking_id"
    t.bigint "ordination_date_id"
    t.string "alt_last_name"
    t.text "add_last_name_info"
    t.string "alt_first_name"
    t.text "add_first_name_info"
    t.bigint "alt_birth_date_id"
    t.text "add_birth_date_info"
    t.bigint "alt_place_of_birth_id"
    t.text "add_place_of_birth_info"
    t.bigint "alt_entrance_date_i1_id"
    t.text "add_entrance_date_i1_info"
    t.bigint "alt_entrance_date_i2_id"
    t.text "add_entrance_date_i2_info"
    t.text "add_entrance_place_info_i1"
    t.text "add_entrance_place_info_i2"
    t.bigint "alt_final_vow_date_id"
    t.text "add_final_vow_date_info"
    t.text "add_status_info"
    t.bigint "alt_death_date_id"
    t.text "add_death_date_info"
    t.bigint "alt_place_of_death_id"
    t.text "add_place_of_death_info"
    t.text "portal_url"
    t.text "georgetown_url"
    t.text "web_resources"
    t.text "biographical_note"
    t.index ["alt_birth_date_id"], name: "index_jesuits_on_alt_birth_date_id"
    t.index ["alt_death_date_id"], name: "index_jesuits_on_alt_death_date_id"
    t.index ["alt_entrance_date_i1_id"], name: "index_jesuits_on_alt_entrance_date_i1_id"
    t.index ["alt_entrance_date_i2_id"], name: "index_jesuits_on_alt_entrance_date_i2_id"
    t.index ["alt_final_vow_date_id"], name: "index_jesuits_on_alt_final_vow_date_id"
    t.index ["alt_place_of_birth_id"], name: "index_jesuits_on_alt_place_of_birth_id"
    t.index ["alt_place_of_death_id"], name: "index_jesuits_on_alt_place_of_death_id"
    t.index ["birth_date_id"], name: "index_jesuits_on_birth_date_id"
    t.index ["death_date_id"], name: "index_jesuits_on_death_date_id"
    t.index ["entrance_date_2_id"], name: "index_jesuits_on_entrance_date_2_id"
    t.index ["entrance_date_id"], name: "index_jesuits_on_entrance_date_id"
    t.index ["entrance_province_2_id"], name: "index_jesuits_on_entrance_province_2_id"
    t.index ["entrance_province_id"], name: "index_jesuits_on_entrance_province_id"
    t.index ["jl_id"], name: "index_jesuits_on_jl_id", unique: true
    t.index ["last_name"], name: "index_jesuits_on_last_name"
    t.index ["linking_id"], name: "index_jesuits_on_linking_id", unique: true
    t.index ["ordination_date_id"], name: "index_jesuits_on_ordination_date_id"
    t.index ["place_of_birth_id"], name: "index_jesuits_on_place_of_birth_id"
    t.index ["place_of_death_id"], name: "index_jesuits_on_place_of_death_id"
    t.index ["status_id"], name: "index_jesuits_on_status_id"
    t.index ["title_id"], name: "index_jesuits_on_title_id"
    t.index ["vow_date_id"], name: "index_jesuits_on_vow_date_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "label"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "abbreviation"
    t.string "label"
    t.string "unabridged"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude", precision: 9, scale: 7
    t.decimal "longitude", precision: 10, scale: 7
    t.string "placeholder_city"
    t.string "placeholder_country"
    t.string "mission_date"
    t.string "vice_province_date"
    t.string "province_date"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", id: :serial, force: :cascade do |t|
    t.binary "query_params"
    t.integer "user_id"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "staticpages", force: :cascade do |t|
    t.text "title"
    t.text "slug"
    t.text "description"
    t.integer "rank"
    t.text "body"
    t.text "blurb"
    t.boolean "publish"
    t.bigint "createdby_id"
    t.bigint "modifiedby_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["createdby_id"], name: "index_staticpages_on_createdby_id"
    t.index ["modifiedby_id"], name: "index_staticpages_on_modifiedby_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "abbreviation"
    t.string "label"
    t.string "unabridged"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "abbreviation"
    t.string "label"
    t.string "unabridged"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "guest", default: false
    t.integer "role_id"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "jesuits", "date_points", column: "alt_birth_date_id"
  add_foreign_key "jesuits", "date_points", column: "alt_death_date_id"
  add_foreign_key "jesuits", "date_points", column: "alt_entrance_date_i1_id"
  add_foreign_key "jesuits", "date_points", column: "alt_entrance_date_i2_id"
  add_foreign_key "jesuits", "date_points", column: "alt_final_vow_date_id"
  add_foreign_key "jesuits", "date_points", column: "birth_date_id"
  add_foreign_key "jesuits", "date_points", column: "death_date_id"
  add_foreign_key "jesuits", "date_points", column: "entrance_date_2_id"
  add_foreign_key "jesuits", "date_points", column: "entrance_date_id"
  add_foreign_key "jesuits", "date_points", column: "ordination_date_id"
  add_foreign_key "jesuits", "date_points", column: "vow_date_id"
  add_foreign_key "jesuits", "places", column: "alt_place_of_birth_id"
  add_foreign_key "jesuits", "places", column: "alt_place_of_death_id"
  add_foreign_key "jesuits", "places", column: "place_of_birth_id"
  add_foreign_key "jesuits", "places", column: "place_of_death_id"
  add_foreign_key "jesuits", "provinces", column: "entrance_province_2_id"
  add_foreign_key "jesuits", "provinces", column: "entrance_province_id"
  add_foreign_key "jesuits", "statuses"
  add_foreign_key "jesuits", "titles"
end
