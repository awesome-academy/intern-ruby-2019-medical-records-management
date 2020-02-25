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

ActiveRecord::Schema.define(version: 2020_02_21_075148) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctor_schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "doctor_id"
    t.date "working_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_schedules_on_doctor_id"
  end

  create_table "doctors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.string "specialist"
    t.string "image"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_doctors_on_account_id"
  end

  create_table "medical_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "appointment_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_medical_records_on_appointment_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.string "notification"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.string "address"
    t.datetime "birthday"
    t.string "image"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_patients_on_account_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.string "title"
    t.text "content"
    t.date "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "doctor_schedules", "doctors"
  add_foreign_key "doctors", "accounts"
  add_foreign_key "medical_records", "appointments"
  add_foreign_key "patients", "accounts"
  add_foreign_key "posts", "accounts"
end
