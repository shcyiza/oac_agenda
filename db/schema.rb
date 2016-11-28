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

ActiveRecord::Schema.define(version: 20161128201502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "datefolwd"
    t.datetime "esdate"
    t.datetime "eedate"
  end

  create_table "belgia", force: :cascade do |t|
    t.string   "ville"
    t.string   "codepostal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "orgn_id"
    t.string   "enom"
    t.text     "edesc"
    t.datetime "esdate"
    t.datetime "eedate"
    t.decimal  "pafpre"
    t.decimal  "pafplace"
    t.string   "pays"
    t.string   "ville"
    t.string   "codepostal"
    t.string   "rue"
    t.string   "nrrue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",             default: false
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
  end

  create_table "events_tags", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "tag_id"
  end

  add_index "events_tags", ["event_id"], name: "index_events_tags_on_event_id", using: :btree
  add_index "events_tags", ["tag_id"], name: "index_events_tags_on_tag_id", using: :btree

  create_table "foldates", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "datefolwd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folevents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folorgs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "orgn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frances", force: :cascade do |t|
    t.string   "ville"
    t.string   "codepostal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orgns", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "oname"
    t.text     "odesc"
    t.string   "oemail"
    t.string   "onum"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "resas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "resanr"
    t.boolean  "resa_claimed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "username"
    t.boolean  "pro"
    t.boolean  "is_admin"
    t.datetime "last_click_at"
    t.datetime "last_seen_at",           default: '2016-11-28 20:23:36'
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "events_tags", "events"
  add_foreign_key "events_tags", "tags"
end
