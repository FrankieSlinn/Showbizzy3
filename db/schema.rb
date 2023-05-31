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

ActiveRecord::Schema[7.0].define(version: 2023_05_31_130125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datelocs", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.bigint "location_id", null: false
    t.date "date"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_datelocs_on_location_id"
    t.index ["show_id"], name: "index_datelocs_on_show_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "venuename"
    t.string "town"
    t.string "address"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.string "placevenue"
    t.string "placetown"
    t.string "placeaddress"
    t.string "placeinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_places_on_show_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.integer "rating"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_reviews_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.string "genre"
    t.string "image"
    t.string "performer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shows_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.boolean "is_performer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "datelocs", "locations"
  add_foreign_key "datelocs", "shows"
  add_foreign_key "locations", "users"
  add_foreign_key "places", "shows"
  add_foreign_key "reviews", "shows"
  add_foreign_key "shows", "users"
end
