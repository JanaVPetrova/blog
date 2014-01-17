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

ActiveRecord::Schema.define(version: 20140117152206) do

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "modifications"
    t.string   "action"
    t.string   "tag"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audits", ["action"], name: "index_audits_on_action", using: :btree
  add_index "audits", ["auditable_id", "auditable_type", "version"], name: "auditable_version_idx", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["tag"], name: "index_audits_on_tag", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "post_comments", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "ancestry"
  end

  add_index "post_comments", ["ancestry"], name: "index_post_comments_on_ancestry", using: :btree
  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "validation_state"
    t.integer  "subject_id"
  end

  add_index "posts", ["subject_id"], name: "index_posts_on_subject_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "approvement_state"
  end

end
