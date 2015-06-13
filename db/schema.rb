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

ActiveRecord::Schema.define(version: 20150613194436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "link_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["link_id"], name: "index_comments_on_link_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "downvotes", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "downvotes", ["comment_id"], name: "index_downvotes_on_comment_id", using: :btree
  add_index "downvotes", ["link_id"], name: "index_downvotes_on_link_id", using: :btree
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "links", ["board_id"], name: "index_links_on_board_id", using: :btree
  add_index "links", ["user_id"], name: "index_links_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["comment_id"], name: "index_votes_on_comment_id", using: :btree
  add_index "votes", ["link_id"], name: "index_votes_on_link_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "links"
  add_foreign_key "comments", "users"
  add_foreign_key "downvotes", "comments"
  add_foreign_key "downvotes", "links"
  add_foreign_key "downvotes", "users"
  add_foreign_key "links", "boards"
  add_foreign_key "links", "users"
  add_foreign_key "votes", "comments"
  add_foreign_key "votes", "links"
  add_foreign_key "votes", "users"
end
