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

ActiveRecord::Schema.define(version: 2019_04_04_120528) do

  create_table "approvals", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manager_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.index ["manager_id", "user_id"], name: "index_approvals_on_manager_id_and_user_id", unique: true
  end

  create_table "holidays", force: :cascade do |t|
    t.date "holiday_date"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_date"], name: "index_holidays_on_holiday_date", unique: true
  end

  create_table "time_offs", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.text "note"
    t.integer "off_type", default: 0, null: false
    t.integer "user_id"
    t.boolean "approved"
    t.integer "approved_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "days_taken", default: 0
    t.index ["user_id"], name: "index_time_offs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "job_title", null: false
    t.integer "total_days"
    t.string "user_level", default: "0", null: false
    t.boolean "needs_approval", default: true
    t.integer "days_taken", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
