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

ActiveRecord::Schema.define(version: 20160622183251) do

  create_table "alternatives", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "sentence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "order"
  end

  add_index "alternatives", ["question_id"], name: "index_alternatives_on_question_id"

  create_table "answers", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "question_id"
    t.integer  "alternative"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "correct"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["test_id"], name: "index_answers_on_test_id"

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "balance"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  create_table "chats", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "practice_id"
  end

  add_index "chats", ["user_id"], name: "index_chats_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "contenido"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "theme_id"
    t.integer  "user_id"
  end

  add_index "comments", ["theme_id"], name: "index_comments_on_theme_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "compositions", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.integer  "question_id"
    t.integer  "number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "compositions", ["evaluation_id"], name: "index_compositions_on_evaluation_id"
  add_index "compositions", ["question_id"], name: "index_compositions_on_question_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
  end

  create_table "donts", force: :cascade do |t|
    t.text     "description"
    t.integer  "heuristic_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "dos", force: :cascade do |t|
    t.text     "description"
    t.integer  "heuristic_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "examples", force: :cascade do |t|
    t.integer  "heuristic_id"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "practice_id"
    t.string   "plunk"
    t.text     "embed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercises", ["practice_id"], name: "index_exercises_on_practice_id"
  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "heuristics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "practices", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "plunk"
    t.text     "embed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "topic_id"
    t.text     "sentence"
    t.integer  "answer"
    t.string   "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
  end

  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id"

  create_table "records", force: :cascade do |t|
    t.string   "operation"
    t.integer  "owner_id"
    t.string   "receiver_id"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "references", force: :cascade do |t|
    t.integer  "heuristic_id"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "evaluation_id"
    t.decimal  "grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tests", ["evaluation_id"], name: "index_tests_on_evaluation_id"
  add_index "tests", ["user_id"], name: "index_tests_on_user_id"

  create_table "themes", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "open"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "themes", ["user_id"], name: "index_themes_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id"
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "rut"
    t.string   "user_type"
    t.boolean  "admin",                  default: false
    t.boolean  "suspended",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
