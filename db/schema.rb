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

ActiveRecord::Schema.define(version: 2018_09_27_024637) do

  create_table "admin_chattings", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "chat_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_chattings_on_admin_id"
    t.index ["chat_id"], name: "index_admin_chattings_on_chat_id"
  end

  create_table "admins", id: false, force: :cascade do |t|
    t.string "mobile"
    t.string "name", null: false
    t.string "password_digest", null: false
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_chattings", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "chat_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_student_chattings_on_chat_id"
    t.index ["student_id"], name: "index_student_chattings_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "mobile", null: false
    t.string "name", null: false
    t.integer "grade", null: false
    t.integer "teacher_id"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile"], name: "index_students_on_mobile", unique: true
  end

  create_table "teacher_chattings", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "chat_id", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_teacher_chattings_on_chat_id"
    t.index ["teacher_id"], name: "index_teacher_chattings_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "mobile", null: false
    t.string "name", null: false
    t.integer "degree", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile"], name: "index_teachers_on_mobile", unique: true
  end

end
