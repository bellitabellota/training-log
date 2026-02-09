# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_08_125054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "exercise_type"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_exercises_on_name", unique: true
  end

  create_table "planned_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "exercise_id", null: false
    t.bigint "training_template_id", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_planned_exercises_on_exercise_id"
    t.index ["training_template_id"], name: "index_planned_exercises_on_training_template_id"
  end

  create_table "planned_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration_seconds"
    t.bigint "planned_exercise_id", null: false
    t.integer "reps"
    t.integer "set_number"
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["planned_exercise_id"], name: "index_planned_sets_on_planned_exercise_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "training_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["name"], name: "index_training_templates_on_name", unique: true
    t.index ["user_id"], name: "index_training_templates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "planned_exercises", "exercises"
  add_foreign_key "planned_exercises", "training_templates"
  add_foreign_key "planned_sets", "planned_exercises"
  add_foreign_key "sessions", "users"
  add_foreign_key "training_templates", "users"
end
