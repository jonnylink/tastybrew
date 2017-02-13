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

ActiveRecord::Schema.define(version: 20170211225821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",                   null: false
    t.string   "category",               null: false
    t.integer  "active",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "recipe_id",              null: false
    t.integer  "rating",                 null: false
    t.text     "comment"
    t.integer  "active",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id",                 null: false
    t.integer  "ingredient_id",             null: false
    t.float    "amount",                    null: false
    t.string   "unit",                      null: false
    t.integer  "active",        default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.string   "name",                          null: false
    t.text     "notes"
    t.integer  "active",            default: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "batch_size"
    t.float    "boil_size"
    t.integer  "boil_time"
    t.float    "original_gravity"
    t.float    "final_gravity"
    t.float    "alcohol_by_volume"
    t.float    "bitterness"
    t.float    "color"
    t.float    "keg_temp"
    t.float    "storage_temp"
    t.float    "age_for"
    t.index ["name"], name: "index_recipes_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "user_img"
    t.text     "bio"
    t.integer  "active",                 default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
