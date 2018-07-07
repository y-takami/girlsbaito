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

ActiveRecord::Schema.define(version: 20150402120651) do

  create_table "admins", force: true do |t|
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
    t.boolean  "suspended",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "applies", force: true do |t|
    t.integer  "girl_id"
    t.integer  "shop_show_id"
    t.boolean  "employment"
    t.date     "employment_day"
    t.integer  "congratulation_money"
    t.string   "method"
    t.string   "note"
    t.date     "interview"
    t.date     "first_work_day"
    t.boolean  "time_over"
    t.string   "invitation_code"
    t.string   "name"
    t.string   "email"
    t.string   "line_id"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applies", ["girl_id"], name: "index_applies_on_girl_id", using: :btree
  add_index "applies", ["shop_show_id"], name: "index_applies_on_shop_show_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "cities", force: true do |t|
    t.integer  "prefecture_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["prefecture_id", "name"], name: "index_cities_on_prefecture_id_and_name", using: :btree
  add_index "cities", ["prefecture_id"], name: "index_cities_on_prefecture_id", using: :btree

  create_table "congratulations", force: true do |t|
    t.integer  "apply_id"
    t.boolean  "first_work_flag"
    t.string   "method"
    t.string   "postal_first"
    t.string   "postal_last"
    t.string   "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "name"
    t.string   "name_sei_kana"
    t.string   "name_mei_kana"
    t.string   "bank_name"
    t.string   "bank_branch_name"
    t.string   "bank_type"
    t.string   "bank_number"
    t.string   "email"
    t.string   "tel"
    t.date     "interview"
    t.date     "first_work_day"
    t.string   "note"
    t.boolean  "policy"
    t.boolean  "examine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "congratulations", ["apply_id"], name: "congratulations_apply_id_fk", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "belong"
    t.string   "name"
    t.string   "name_kana"
    t.string   "company_name"
    t.string   "company_name_kana"
    t.string   "mail"
    t.string   "tel"
    t.string   "homepage"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.integer  "shop_show_id"
    t.boolean  "daily",        default: false
    t.boolean  "guarantee",    default: false
    t.boolean  "carfare",      default: false
    t.boolean  "beginner",     default: false
    t.boolean  "experience",   default: false
    t.boolean  "menstruation", default: false
    t.boolean  "dormitory",    default: false
    t.boolean  "room",         default: false
    t.boolean  "nursery",      default: false
    t.boolean  "pickup",       default: false
    t.boolean  "alibi",        default: false
    t.boolean  "home",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["shop_show_id"], name: "features_shop_show_id_fk", using: :btree

  create_table "girls", force: true do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "tel"
    t.string   "line_id"
    t.string   "method"
    t.string   "postal_first"
    t.string   "postal_last"
    t.string   "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "name_sei_kana"
    t.string   "name_mei_kana"
    t.string   "bank_name"
    t.string   "bank_branch_name"
    t.string   "bank_type"
    t.string   "bank_number"
    t.string   "invitation_code"
    t.integer  "invitation_num",         default: 0
    t.integer  "invitation_point",       default: 0
    t.string   "favorite"
    t.string   "history"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "girls", ["email"], name: "index_girls_on_email", unique: true, using: :btree
  add_index "girls", ["invitation_code"], name: "index_girls_on_invitation_code", unique: true, using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "girl_id"
    t.integer  "application_amount"
    t.string   "method"
    t.string   "postal_first"
    t.string   "postal_last"
    t.string   "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "name"
    t.string   "name_sei_kana"
    t.string   "name_mei_kana"
    t.string   "bank_name"
    t.string   "bank_branch_name"
    t.string   "bank_type"
    t.string   "bank_number"
    t.string   "email"
    t.string   "tel"
    t.boolean  "examine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "girl_id"
    t.integer  "congratulation_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefectures", force: true do |t|
    t.string   "region"
    t.string   "name"
    t.string   "romaji"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prefectures", ["name"], name: "index_prefectures_on_name", using: :btree
  add_index "prefectures", ["region"], name: "index_prefectures_on_region", using: :btree
  add_index "prefectures", ["romaji"], name: "index_prefectures_on_romaji", using: :btree

  create_table "questions", force: true do |t|
    t.string   "question"
    t.string   "answer"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_infos", force: true do |t|
    t.integer  "group_number",     default: 1
    t.string   "shop_name"
    t.string   "url"
    t.string   "admin_name"
    t.string   "admin_name_sei"
    t.string   "admin_name_mei"
    t.string   "admin_email"
    t.string   "admin_tel"
    t.string   "manager_email"
    t.string   "manager_name"
    t.string   "manager_name_sei"
    t.string   "manager_name_mei"
    t.string   "postal_first"
    t.string   "postal_last"
    t.string   "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "password_digest"
    t.boolean  "examine",          default: false
    t.boolean  "suspended",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shop_infos", ["admin_email"], name: "index_shop_infos_on_admin_email", unique: true, using: :btree

  create_table "shop_shows", force: true do |t|
    t.integer  "shop_info_id"
    t.string   "shop_name"
    t.string   "url"
    t.integer  "prefecture_id"
    t.integer  "city_id"
    t.string   "house_number"
    t.integer  "payment_hour_low"
    t.integer  "payment_hour_high"
    t.string   "payment_day"
    t.integer  "category_id"
    t.integer  "route_id"
    t.integer  "station_id"
    t.string   "title"
    t.string   "summary"
    t.boolean  "time_morning"
    t.boolean  "time_noon"
    t.boolean  "time_afternoon"
    t.boolean  "time_night"
    t.boolean  "time_midnight"
    t.string   "job_content"
    t.integer  "congratulation_money"
    t.string   "message"
    t.string   "line_id"
    t.string   "note"
    t.string   "main_image"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "license"
    t.boolean  "stop_flag",            default: false
    t.boolean  "stop_flag_shop",       default: false
    t.boolean  "examine",              default: false
    t.integer  "shop_point",           default: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shop_shows", ["category_id"], name: "index_shop_shows_on_category_id", using: :btree
  add_index "shop_shows", ["city_id"], name: "index_shop_shows_on_city_id", using: :btree
  add_index "shop_shows", ["congratulation_money"], name: "index_shop_shows_on_congratulation_money", using: :btree
  add_index "shop_shows", ["payment_day"], name: "index_shop_shows_on_payment_day", using: :btree
  add_index "shop_shows", ["payment_hour_high"], name: "index_shop_shows_on_payment_hour_high", using: :btree
  add_index "shop_shows", ["payment_hour_low"], name: "index_shop_shows_on_payment_hour_low", using: :btree
  add_index "shop_shows", ["prefecture_id"], name: "index_shop_shows_on_prefecture_id", using: :btree
  add_index "shop_shows", ["route_id"], name: "index_shop_shows_on_route_id", using: :btree
  add_index "shop_shows", ["shop_info_id"], name: "index_shop_shows_on_shop_info_id", using: :btree
  add_index "shop_shows", ["shop_point"], name: "index_shop_shows_on_shop_point", using: :btree
  add_index "shop_shows", ["station_id"], name: "index_shop_shows_on_station_id", using: :btree

  create_table "stations", force: true do |t|
    t.integer  "route_id"
    t.integer  "prefecture_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stations", ["name"], name: "index_stations_on_name", using: :btree
  add_index "stations", ["prefecture_id"], name: "index_stations_on_prefecture_id", using: :btree
  add_index "stations", ["route_id"], name: "index_stations_on_route_id", using: :btree

  add_foreign_key "applies", "girls", name: "applies_girl_id_fk"
  add_foreign_key "applies", "shop_shows", name: "applies_shop_show_id_fk"

  add_foreign_key "cities", "prefectures", name: "cities_prefecture_id_fk"

  add_foreign_key "congratulations", "applies", name: "congratulations_apply_id_fk"

  add_foreign_key "features", "shop_shows", name: "features_shop_show_id_fk"

  add_foreign_key "shop_shows", "shop_infos", name: "shop_shows_shop_info_id_fk"

  add_foreign_key "stations", "prefectures", name: "stations_prefecture_id_fk"

end
