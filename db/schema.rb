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

ActiveRecord::Schema.define(:version => 20101003111650) do

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "position"
    t.integer  "creator_id"
    t.string   "image_url"
    t.string   "color"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "sc_id"
    t.string   "username"
    t.string   "full_name"
    t.string   "permalink_url"
    t.string   "avatar_url"
    t.integer  "position"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
  end

  add_index "users", ["tag_id"], :name => "index_users_on_tag_id"

end
