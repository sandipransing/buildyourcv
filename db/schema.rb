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

ActiveRecord::Schema.define(:version => 20100804192219) do

  create_table "educations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.string   "where"
    t.string   "what"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.string   "email"
    t.string   "mobile"
    t.string   "languages"
    t.text     "summary"
    t.string   "address"
    t.string   "landmark"
    t.string   "education"
    t.string   "website"
    t.string   "company"
    t.string   "designation"
    t.string   "areas_of_speciality"
    t.date     "birth_date"
    t.string   "nationality"
    t.text     "interests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_experiences", :force => true do |t|
    t.integer  "user_id"
    t.string   "where"
    t.text     "summary"
    t.date     "from"
    t.date     "to"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
