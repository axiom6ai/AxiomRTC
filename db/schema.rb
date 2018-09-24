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

ActiveRecord::Schema.define(version: 2018_09_23_162847) do

  create_table "admins", id: false, force: :cascade do |t|
    t.string "mobile"
    t.string "name", null: false
    t.string "password_digest", null: false
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "student_started_at"
    t.datetime "student_leaved_at"
    t.integer "teacher_id"
    t.datetime "teacher_started_at"
    t.datetime "teacher_leaved_at"
    t.integer "duration_minutes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_chats_on_student_id"
    t.index ["teacher_id"], name: "index_chats_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "mobile", null: false
    t.string "name", null: false
    t.integer "grade", null: false
    t.integer "teacher_id"
    t.integer "chat_count", default: 0
    t.integer "chat_minutes", default: 0
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile"], name: "index_students_on_mobile", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "mobile"
    t.string "name", null: false
    t.string "degree", null: false
    t.integer "student_count", default: 0
    t.integer "chat_count", default: 0
    t.integer "chat_minutes", default: 0
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile"], name: "index_teachers_on_mobile", unique: true
  end

end
