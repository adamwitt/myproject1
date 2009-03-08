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

ActiveRecord::Schema.define(:version => 20090305122035) do

  create_table "articles", :force => true do |t|
    t.date   "created_at", :null => false
    t.string "author",     :null => false
    t.string "title",      :null => false
    t.text   "content",    :null => false
  end

  create_table "fighters", :force => true do |t|
    t.string  "first_name",                                         :null => false
    t.string  "last_name",                                          :null => false
    t.string  "ring_name",                                          :null => false
    t.string  "email",              :default => "",                 :null => false
    t.string  "gender",                                             :null => false
    t.integer "wins",               :default => 0,                  :null => false
    t.integer "losses",             :default => 0,                  :null => false
    t.integer "draws",              :default => 0,                  :null => false
    t.integer "kos",                :default => 0,                  :null => false
    t.text    "about",                                              :null => false
    t.float   "min_weight",         :default => 0.0,                :null => false
    t.float   "max_weight",         :default => 0.0,                :null => false
    t.string  "status",             :default => "ACTIVE",           :null => false
    t.date    "created_at",                                         :null => false
    t.date    "updated_at",                                         :null => false
    t.integer "gym_id"
    t.string  "experience",         :default => "5 or less fights"
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_size"
  end

  create_table "fighters_rules", :id => false, :force => true do |t|
    t.integer "rule_id",    :null => false
    t.integer "fighter_id", :null => false
  end

  create_table "gyms", :force => true do |t|
    t.string  "name",                     :default => "",    :null => false
    t.string  "first_name",               :default => "",    :null => false
    t.string  "last_name",                :default => "",    :null => false
    t.string  "secondary_contact_number", :default => "",    :null => false
    t.string  "primary_contact_number",   :default => "",    :null => false
    t.string  "email",                    :default => "",    :null => false
    t.string  "website",                  :default => "",    :null => false
    t.string  "state",                    :default => "",    :null => false
    t.text    "about",                                       :null => false
    t.string  "login_id",                 :default => "",    :null => false
    t.string  "password",                 :default => "",    :null => false
    t.date    "created_at",                                  :null => false
    t.date    "updated_at",                                  :null => false
    t.integer "number_of_logins",         :default => 0,     :null => false
    t.integer "consecutive_updates",      :default => 0,     :null => false
    t.date    "updated_on",                                  :null => false
    t.string  "address_line_1"
    t.string  "address_line_2",           :default => ""
    t.string  "city"
    t.boolean "activated",                :default => false
    t.string  "activation_code"
    t.string  "secret_question",          :default => ""
    t.string  "secret_answer",            :default => ""
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_size"
  end

  create_table "news", :force => true do |t|
    t.date   "created_at", :null => false
    t.string "message",    :null => false
  end

  create_table "rules", :force => true do |t|
    t.string "discipline"
  end

end
