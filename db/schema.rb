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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130122070127) do

  create_table "districts", :force => true do |t|
    t.string   "guid",                              :null => false
    t.string   "name",                              :null => false
    t.string   "city_id",                           :null => false
    t.string   "district_type", :default => "Quan", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_categories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "place_category_rels", :force => true do |t|
    t.integer "place_id",         :null => false
    t.integer "main_category_id", :null => false
    t.integer "sub_category_id",  :null => false
  end

  add_index "place_category_rels", ["place_id", "main_category_id", "sub_category_id"], :name => "place_cat_rel_index"

  create_table "places", :force => true do |t|
    t.string  "guid",         :null => false
    t.string  "name",         :null => false
    t.string  "address",      :null => false
    t.string  "tho_dia_link"
    t.string  "phone"
    t.string  "email"
    t.string  "website"
    t.text    "tag_list"
    t.string  "city_id",      :null => false
    t.integer "district_id",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "asshole_name"
    t.string   "icon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", :force => true do |t|
    t.string  "name",             :null => false
    t.integer "main_category_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nickname"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
