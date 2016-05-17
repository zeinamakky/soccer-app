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

ActiveRecord::Schema.define(version: 20160517024802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allegiances", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "pub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.string   "channel"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "league"
    t.string   "home_team_name"
    t.string   "away_team_name"
    t.integer  "home_team_goals"
    t.integer  "away_team_goals"
    t.string   "home_team_icon"
    t.string   "away_team_icon"
  end

  create_table "games_teams", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "game_id"
  end

  add_index "games_teams", ["game_id"], name: "index_games_teams_on_game_id", using: :btree
  add_index "games_teams", ["team_id"], name: "index_games_teams_on_team_id", using: :btree

  create_table "pub_games", force: :cascade do |t|
    t.integer  "pub_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "away_team_icon_id"
    t.integer  "home_team_icon_id"
    t.integer  "game_id"
  end

  create_table "pub_photos", force: :cascade do |t|
    t.integer  "pub_id"
    t.string   "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pub_users", force: :cascade do |t|
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
  end

  add_index "pub_users", ["email"], name: "index_pub_users_on_email", unique: true, using: :btree
  add_index "pub_users", ["reset_password_token"], name: "index_pub_users_on_reset_password_token", unique: true, using: :btree

  create_table "pubs", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.integer  "pub_user_id"
    t.string   "map"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "pub_id"
    t.string   "author"
    t.text     "review_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "league"
  end

  create_table "user_allegiances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pub_id"
  end

  create_table "user_logins", force: :cascade do |t|
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
    t.string   "provider"
    t.string   "uid"
  end

  add_index "user_logins", ["email"], name: "index_user_logins_on_email", unique: true, using: :btree
  add_index "user_logins", ["reset_password_token"], name: "index_user_logins_on_reset_password_token", unique: true, using: :btree

  create_table "user_photos", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_username"
    t.string   "twitter_username"
    t.string   "avatar"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_login_id"
    t.text     "description"
    t.integer  "user_photo_id"
  end

end
