# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101002092511) do

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "permalink",  :null => false
    t.integer  "position",   :null => false
    t.integer  "creator_id", :null => false
    t.string   "image_url",  :null => false
    t.string   "color",      :null => false
    t.string   "secret",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "sc_id",         :null => false
    t.string   "username",      :null => false
    t.string   "full_name",     :null => false
    t.string   "permalink_url", :null => false
    t.string   "avatar_url",    :null => false
    t.integer  "position",      :null => false
    t.integer  "tag_id",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["tag_id"], :name => "index_users_on_tag_id", :unique => true

end
