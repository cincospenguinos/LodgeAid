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

ActiveRecord::Schema.define(version: 20181207235255) do

  create_table "attendees", force: :cascade do |t|
    t.integer "mason_id"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mason_id"], name: "index_attendees_on_mason_id"
    t.index ["meeting_id"], name: "index_attendees_on_meeting_id"
  end

  create_table "masons", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "degree"
    t.integer "officer_position"
    t.string "email_address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "membership_number"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "meeting_type"
    t.datetime "date_occurred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "permissions"
    t.integer "mason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified"
  end

end
