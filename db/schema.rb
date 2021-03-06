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

ActiveRecord::Schema.define(version: 20150312021950) do

  create_table "departments", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lecturers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "avatar"
    t.boolean  "admin",           default: false
    t.integer  "department_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "lecturers", ["department_id"], name: "index_lecturers_on_department_id"
  add_index "lecturers", ["email"], name: "index_lecturers_on_email", unique: true

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subjects", ["department_id"], name: "index_subjects_on_department_id"

  create_table "teachings", force: :cascade do |t|
    t.integer  "lecturer_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teachings", ["lecturer_id"], name: "index_teachings_on_lecturer_id"
  add_index "teachings", ["subject_id"], name: "index_teachings_on_subject_id"

end
