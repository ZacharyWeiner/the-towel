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

ActiveRecord::Schema.define(version: 20170816170710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "action_type"
    t.string "user_id"
    t.integer "model_id"
    t.integer "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.text "banner_image"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cohorts_transits", id: false, force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "transit_id"
    t.index ["cohort_id"], name: "index_cohorts_transits_on_cohort_id"
    t.index ["transit_id"], name: "index_cohorts_transits_on_transit_id"
  end

  create_table "cohorts_users", id: false, force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "user_id", null: false
    t.bigint "users_id"
    t.index ["cohort_id"], name: "index_cohorts_users_on_cohort_id"
    t.index ["users_id"], name: "index_cohorts_users_on_users_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "website"
    t.string "phone_number"
    t.string "contact_email"
    t.string "company_type"
    t.boolean "whatsapp"
    t.text "logo"
    t.text "banner_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_comments", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "cohort_id"
    t.bigint "user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_event_comments_on_cohort_id"
    t.index ["event_id"], name: "index_event_comments_on_event_id"
    t.index ["user_id"], name: "index_event_comments_on_user_id"
  end

  create_table "event_rsvps", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_rsvps_on_event_id"
    t.index ["user_id"], name: "index_event_rsvps_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "title"
    t.text "description"
    t.integer "cost"
    t.integer "capacity"
    t.bigint "location_id"
    t.text "meeting_point"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cohort_id"
    t.index ["cohort_id"], name: "index_events_on_cohort_id"
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id", null: false
    t.bigint "users_id"
    t.boolean "paid"
    t.text "notes"
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["users_id"], name: "index_events_users_on_users_id"
  end

  create_table "location_details", force: :cascade do |t|
    t.bigint "location_id"
    t.text "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_details_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_side_trips", id: false, force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "side_trip_id"
    t.index ["location_id"], name: "index_locations_side_trips_on_location_id"
    t.index ["side_trip_id"], name: "index_locations_side_trips_on_side_trip_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.date "checkin_date"
    t.time "checkin_time"
    t.date "checkout_date"
    t.time "checkout_time"
    t.string "phone"
    t.string "website"
    t.string "address"
    t.bigint "location_id"
    t.text "map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_lodgings_on_location_id"
  end

  create_table "lodgings_side_trips", id: false, force: :cascade do |t|
    t.bigint "lodging_id"
    t.bigint "side_trip_id"
    t.index ["lodging_id"], name: "index_lodgings_side_trips_on_lodging_id"
    t.index ["side_trip_id"], name: "index_lodgings_side_trips_on_side_trip_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cohort_id"
    t.text "content"
    t.bigint "actions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actions_id"], name: "index_posts_on_actions_id"
    t.index ["cohort_id"], name: "index_posts_on_cohort_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.integer "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "side_trips", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_public"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "side_trips_transits", id: false, force: :cascade do |t|
    t.bigint "transit_id"
    t.bigint "side_trip_id"
    t.index ["side_trip_id"], name: "index_side_trips_transits_on_side_trip_id"
    t.index ["transit_id"], name: "index_side_trips_transits_on_transit_id"
  end

  create_table "side_trips_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "side_trip_id"
    t.index ["side_trip_id"], name: "index_side_trips_users_on_side_trip_id"
    t.index ["user_id"], name: "index_side_trips_users_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "transits", force: :cascade do |t|
    t.date "date"
    t.time "departure_time"
    t.string "title"
    t.string "travel_type"
    t.bigint "company_id"
    t.string "route_number"
    t.bigint "departure_location_id"
    t.text "departure_map"
    t.bigint "arrival_location_id"
    t.time "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_location_id"], name: "index_transits_on_arrival_location_id"
    t.index ["company_id"], name: "index_transits_on_company_id"
    t.index ["departure_location_id"], name: "index_transits_on_departure_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cohorts_transits", "cohorts"
  add_foreign_key "cohorts_transits", "transits"
  add_foreign_key "cohorts_users", "cohorts"
  add_foreign_key "cohorts_users", "users", column: "users_id"
  add_foreign_key "event_comments", "cohorts"
  add_foreign_key "event_comments", "events"
  add_foreign_key "event_comments", "users"
  add_foreign_key "event_rsvps", "events"
  add_foreign_key "event_rsvps", "users"
  add_foreign_key "events", "cohorts"
  add_foreign_key "events", "locations"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users", column: "users_id"
  add_foreign_key "location_details", "locations"
  add_foreign_key "locations_side_trips", "locations"
  add_foreign_key "locations_side_trips", "side_trips"
  add_foreign_key "lodgings", "locations"
  add_foreign_key "lodgings_side_trips", "lodgings"
  add_foreign_key "lodgings_side_trips", "side_trips"
  add_foreign_key "posts", "actions", column: "actions_id"
  add_foreign_key "posts", "cohorts"
  add_foreign_key "posts", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "side_trips_transits", "side_trips"
  add_foreign_key "side_trips_transits", "transits"
  add_foreign_key "side_trips_users", "side_trips"
  add_foreign_key "side_trips_users", "users"
  add_foreign_key "transits", "companies"
end
