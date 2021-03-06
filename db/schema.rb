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

ActiveRecord::Schema.define(version: 20171121064423) do

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

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.text "content"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_announcements_on_cohort_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "facebook"
    t.string "linkedin"
    t.string "instagram"
    t.string "job_title"
    t.string "company_name"
    t.boolean "is_remote"
    t.text "description"
    t.text "why_me"
    t.string "current_city"
    t.boolean "is_traveling"
    t.text "best_travel_experience"
    t.integer "years_in_profession"
    t.string "contact_method"
    t.string "whatsapp"
    t.string "favorite_country"
    t.string "favorite_city"
    t.text "best_project"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "chat_rooms_cohorts", id: false, force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_chat_rooms_cohorts_on_chat_room_id"
    t.index ["cohort_id"], name: "index_chat_rooms_cohorts_on_cohort_id"
  end

  create_table "chat_rooms_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_room_id", null: false
    t.bigint "users_id"
    t.bigint "chat_rooms_id"
    t.index ["chat_rooms_id"], name: "index_chat_rooms_users_on_chat_rooms_id"
    t.index ["users_id"], name: "index_chat_rooms_users_on_users_id"
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
    t.bigint "organization_id"
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

  create_table "contact_submissions", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_emails_on_conversation_id"
    t.index ["user_id"], name: "index_emails_on_user_id"
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
    t.boolean "is_paid"
    t.text "notes"
    t.string "charge_id"
    t.index ["event_id"], name: "index_event_rsvps_on_event_id"
    t.index ["user_id"], name: "index_event_rsvps_on_user_id"
  end

  create_table "event_waitlists", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_waitlists_on_event_id"
    t.index ["user_id"], name: "index_event_waitlists_on_user_id"
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
    t.bigint "track_id"
    t.bigint "chat_room_id"
    t.bigint "side_trip_id"
    t.boolean "is_public"
    t.index ["chat_room_id"], name: "index_events_on_chat_room_id"
    t.index ["cohort_id"], name: "index_events_on_cohort_id"
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "events_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "event_id", null: false
    t.bigint "tags_id"
    t.bigint "events_id"
    t.index ["events_id"], name: "index_events_tags_on_events_id"
    t.index ["tags_id"], name: "index_events_tags_on_tags_id"
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

  create_table "housings", force: :cascade do |t|
    t.string "name"
    t.integer "rooms"
    t.decimal "bathrooms"
    t.string "street_number"
    t.bigint "location_id"
    t.text "map"
    t.string "street_name"
    t.string "postal_code"
    t.string "neighborhood"
    t.text "other_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit"
    t.string "full_address"
    t.index ["location_id"], name: "index_housings_on_location_id"
  end

  create_table "housings_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "housing_id", null: false
    t.bigint "tags_id"
    t.bigint "housings_id"
    t.index ["housings_id"], name: "index_housings_tags_on_housings_id"
    t.index ["tags_id"], name: "index_housings_tags_on_tags_id"
  end

  create_table "housings_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "housing_id", null: false
    t.bigint "users_id"
    t.bigint "housings_id"
    t.index ["housings_id"], name: "index_housings_users_on_housings_id"
    t.index ["users_id"], name: "index_housings_users_on_users_id"
  end

  create_table "location_details", force: :cascade do |t|
    t.bigint "location_id"
    t.text "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["location_id"], name: "index_location_details_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_locations_on_chat_room_id"
  end

  create_table "locations_side_trips", id: false, force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "side_trip_id"
    t.index ["location_id"], name: "index_locations_side_trips_on_location_id"
    t.index ["side_trip_id"], name: "index_locations_side_trips_on_side_trip_id"
  end

  create_table "locations_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "location_id", null: false
    t.bigint "tags_id"
    t.bigint "locations_id"
    t.index ["locations_id"], name: "index_locations_tags_on_locations_id"
    t.index ["tags_id"], name: "index_locations_tags_on_tags_id"
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
    t.text "description"
    t.index ["location_id"], name: "index_lodgings_on_location_id"
  end

  create_table "lodgings_side_trips", id: false, force: :cascade do |t|
    t.bigint "lodging_id"
    t.bigint "side_trip_id"
    t.index ["lodging_id"], name: "index_lodgings_side_trips_on_lodging_id"
    t.index ["side_trip_id"], name: "index_lodgings_side_trips_on_side_trip_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "notification_type"
    t.bigint "notification_obeject_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "logo"
    t.text "description"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "event_id"
    t.bigint "location_id"
    t.bigint "post_id"
    t.text "picture"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "side_trip_id"
    t.bigint "lodging_id"
    t.bigint "user_id"
    t.bigint "housing_id"
    t.index ["cohort_id"], name: "index_photos_on_cohort_id"
    t.index ["event_id"], name: "index_photos_on_event_id"
    t.index ["location_id"], name: "index_photos_on_location_id"
    t.index ["lodging_id"], name: "index_photos_on_lodging_id"
    t.index ["post_id"], name: "index_photos_on_post_id"
    t.index ["side_trip_id"], name: "index_photos_on_side_trip_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cohort_id"
    t.text "content"
    t.bigint "actions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.bigint "side_trip_id"
    t.index ["actions_id"], name: "index_posts_on_actions_id"
    t.index ["cohort_id"], name: "index_posts_on_cohort_id"
    t.index ["event_id"], name: "index_posts_on_event_id"
    t.index ["side_trip_id"], name: "index_posts_on_side_trip_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "display_name"
    t.string "hometown"
    t.string "phone_number"
    t.boolean "whatsapp"
    t.string "facebook"
    t.string "instagram"
    t.date "birthday"
    t.string "website"
    t.string "snapchat"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.text "note"
    t.bigint "tags_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "object_id"
    t.string "object_type"
    t.index ["tags_id"], name: "index_ratings_on_tags_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
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

  create_table "roomate_requests", force: :cascade do |t|
    t.bigint "requested_by"
    t.bigint "requested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_items", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "location_id"
    t.date "arrival_date"
    t.date "departure_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_schedule_items_on_cohort_id"
    t.index ["location_id"], name: "index_schedule_items_on_location_id"
  end

  create_table "schedule_items_transits", id: false, force: :cascade do |t|
    t.bigint "schedule_item_id"
    t.bigint "transit_id"
    t.index ["schedule_item_id"], name: "index_schedule_items_transits_on_schedule_item_id"
    t.index ["transit_id"], name: "index_schedule_items_transits_on_transit_id"
  end

  create_table "side_trips", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_public"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cohort_id"
    t.text "description"
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_side_trips_on_chat_room_id"
    t.index ["cohort_id"], name: "index_side_trips_on_cohort_id"
  end

  create_table "side_trips_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "side_trip_id", null: false
    t.bigint "tags_id"
    t.bigint "side_trips_id"
    t.index ["side_trips_id"], name: "index_side_trips_tags_on_side_trips_id"
    t.index ["tags_id"], name: "index_side_trips_tags_on_tags_id"
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

  create_table "tag_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_type_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_type_id"], name: "index_tags_on_tag_type_id"
  end

  create_table "tags_tracks", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "track_id", null: false
    t.bigint "tags_id"
    t.bigint "tracks_id"
    t.index ["tags_id"], name: "index_tags_tracks_on_tags_id"
    t.index ["tracks_id"], name: "index_tags_tracks_on_tracks_id"
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.bigint "users_id"
    t.bigint "tags_id"
    t.index ["tags_id"], name: "index_tags_users_on_tags_id"
    t.index ["users_id"], name: "index_tags_users_on_users_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "created_by"
    t.bigint "assigned_to"
    t.string "status"
    t.text "details"
    t.text "resolution"
    t.date "resolved_on"
    t.string "title"
    t.bigint "resolved_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cohort_id"
    t.index ["cohort_id"], name: "index_tickets_on_cohort_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "events_id"
    t.bigint "location_id"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_tracks_on_chat_room_id"
    t.index ["cohort_id"], name: "index_tracks_on_cohort_id"
    t.index ["events_id"], name: "index_tracks_on_events_id"
    t.index ["location_id"], name: "index_tracks_on_location_id"
  end

  create_table "tracks_users", id: false, force: :cascade do |t|
    t.bigint "track_id"
    t.bigint "user_id"
    t.index ["track_id"], name: "index_tracks_users_on_track_id"
    t.index ["user_id"], name: "index_tracks_users_on_user_id"
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

  create_table "user_announcements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cohort_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "announcement_id"
    t.index ["announcement_id"], name: "index_user_announcements_on_announcement_id"
    t.index ["cohort_id"], name: "index_user_announcements_on_cohort_id"
    t.index ["user_id"], name: "index_user_announcements_on_user_id"
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
    t.bigint "organization_id"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "cohorts"
  add_foreign_key "announcements", "users"
  add_foreign_key "chat_rooms", "users"
  add_foreign_key "chat_rooms_cohorts", "chat_rooms"
  add_foreign_key "chat_rooms_cohorts", "cohorts"
  add_foreign_key "chat_rooms_users", "chat_rooms", column: "chat_rooms_id"
  add_foreign_key "chat_rooms_users", "users", column: "users_id"
  add_foreign_key "cohorts_transits", "cohorts"
  add_foreign_key "cohorts_transits", "transits"
  add_foreign_key "cohorts_users", "cohorts"
  add_foreign_key "cohorts_users", "users", column: "users_id"
  add_foreign_key "event_comments", "cohorts"
  add_foreign_key "event_comments", "events"
  add_foreign_key "event_comments", "users"
  add_foreign_key "event_rsvps", "events"
  add_foreign_key "event_rsvps", "users"
  add_foreign_key "event_waitlists", "events"
  add_foreign_key "event_waitlists", "users"
  add_foreign_key "events", "chat_rooms"
  add_foreign_key "events", "cohorts"
  add_foreign_key "events", "locations"
  add_foreign_key "events_tags", "events", column: "events_id"
  add_foreign_key "events_tags", "tags", column: "tags_id"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users", column: "users_id"
  add_foreign_key "housings", "locations"
  add_foreign_key "housings_tags", "housings", column: "housings_id"
  add_foreign_key "housings_tags", "tags", column: "tags_id"
  add_foreign_key "housings_users", "housings", column: "housings_id"
  add_foreign_key "housings_users", "users", column: "users_id"
  add_foreign_key "location_details", "locations"
  add_foreign_key "locations", "chat_rooms"
  add_foreign_key "locations_side_trips", "locations"
  add_foreign_key "locations_side_trips", "side_trips"
  add_foreign_key "locations_tags", "locations", column: "locations_id"
  add_foreign_key "locations_tags", "tags", column: "tags_id"
  add_foreign_key "lodgings", "locations"
  add_foreign_key "lodgings_side_trips", "lodgings"
  add_foreign_key "lodgings_side_trips", "side_trips"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "photos", "cohorts"
  add_foreign_key "photos", "events"
  add_foreign_key "photos", "locations"
  add_foreign_key "photos", "lodgings"
  add_foreign_key "photos", "posts"
  add_foreign_key "photos", "side_trips"
  add_foreign_key "photos", "users"
  add_foreign_key "posts", "actions", column: "actions_id"
  add_foreign_key "posts", "cohorts"
  add_foreign_key "posts", "events"
  add_foreign_key "posts", "side_trips"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "ratings", "tags", column: "tags_id"
  add_foreign_key "ratings", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "schedule_items", "cohorts"
  add_foreign_key "schedule_items", "locations"
  add_foreign_key "schedule_items_transits", "schedule_items"
  add_foreign_key "schedule_items_transits", "transits"
  add_foreign_key "side_trips", "chat_rooms"
  add_foreign_key "side_trips", "cohorts"
  add_foreign_key "side_trips_tags", "side_trips", column: "side_trips_id"
  add_foreign_key "side_trips_tags", "tags", column: "tags_id"
  add_foreign_key "side_trips_transits", "side_trips"
  add_foreign_key "side_trips_transits", "transits"
  add_foreign_key "side_trips_users", "side_trips"
  add_foreign_key "side_trips_users", "users"
  add_foreign_key "tags", "tag_types"
  add_foreign_key "tags_tracks", "tags", column: "tags_id"
  add_foreign_key "tags_tracks", "tracks", column: "tracks_id"
  add_foreign_key "tags_users", "tags", column: "tags_id"
  add_foreign_key "tags_users", "users", column: "users_id"
  add_foreign_key "tickets", "cohorts"
  add_foreign_key "tracks", "chat_rooms"
  add_foreign_key "tracks", "cohorts"
  add_foreign_key "tracks", "events", column: "events_id"
  add_foreign_key "tracks", "locations"
  add_foreign_key "tracks_users", "tracks"
  add_foreign_key "tracks_users", "users"
  add_foreign_key "transits", "companies"
  add_foreign_key "user_announcements", "announcements"
  add_foreign_key "user_announcements", "cohorts"
  add_foreign_key "user_announcements", "users"
end
