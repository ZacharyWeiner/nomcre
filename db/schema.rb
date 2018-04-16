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

ActiveRecord::Schema.define(version: 20180416221642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistants", force: :cascade do |t|
    t.string "name"
    t.string "paypal_email"
    t.string "phone"
    t.integer "rate"
    t.string "assistant_type"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proposal_id"
    t.index ["location_id"], name: "index_assistants_on_location_id"
    t.index ["proposal_id"], name: "index_assistants_on_proposal_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "topic"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_chatrooms_on_proposal_id"
  end

  create_table "collection_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "collection_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "height"
    t.integer "width"
    t.string "video"
    t.string "item_type"
    t.integer "order"
    t.boolean "is_header"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
    t.index ["user_id"], name: "index_collection_items_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured"
    t.string "description"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "collections_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "collection_id"
    t.index ["collection_id"], name: "index_collections_tags_on_collection_id"
    t.index ["tag_id"], name: "index_collections_tags_on_tag_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instagram"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.string "location_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "location_id"
    t.index ["location_id"], name: "index_locations_tags_on_location_id"
    t.index ["tag_id"], name: "index_locations_tags_on_tag_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chatroom_id"
    t.text "content"
    t.text "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "notification_type"
    t.bigint "notification_object_id"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_requests", force: :cascade do |t|
    t.bigint "requested_by"
    t.bigint "requested"
    t.boolean "accepted"
    t.boolean "approved"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_proposal_requests_on_proposal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "deadline"
    t.integer "price"
    t.boolean "accepted"
    t.bigint "company_id"
    t.string "proposal_type"
    t.boolean "completed"
    t.date "completed_on"
    t.boolean "paid"
    t.string "charge_id"
    t.text "bts", default: [], array: true
    t.text "focus_points", default: [], array: true
    t.string "add_ons", default: [], array: true
    t.string "time_of_day"
    t.string "background"
    t.bigint "user_id"
    t.string "deposit_id"
    t.boolean "deposit_paid"
    t.date "deposit_paid_on"
    t.text "model_release"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shoot_type"
    t.boolean "raw"
    t.string "background_note"
    t.string "instagram_1"
    t.string "instagram_2"
    t.string "instagram_3"
    t.string "instagram_4"
    t.string "image_board_1"
    t.string "image_board_2"
    t.string "image_board_3"
    t.string "image_board_4"
    t.date "balance_paid_on"
    t.integer "shot_count"
    t.index ["company_id"], name: "index_proposals_on_company_id"
    t.index ["location_id"], name: "index_proposals_on_location_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.text "notes"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_schedule_items_on_location_id"
    t.index ["user_id"], name: "index_schedule_items_on_user_id"
  end

  create_table "shot_list_items", force: :cascade do |t|
    t.bigint "proposal_id"
    t.string "description"
    t.string "background"
    t.string "upload"
    t.string "item_type"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "focus_point"
    t.string "reference_image"
    t.string "aspect_ratio"
    t.index ["proposal_id"], name: "index_shot_list_items_on_proposal_id"
    t.index ["task_id"], name: "index_shot_list_items_on_task_id"
  end

  create_table "showcase_images", force: :cascade do |t|
    t.string "file"
    t.string "showcase_type"
    t.boolean "show"
    t.integer "order"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "height"
    t.integer "width"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "user_id"
    t.index ["tag_id"], name: "index_tags_users_on_tag_id"
    t.index ["user_id"], name: "index_tags_users_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.date "deadline"
    t.boolean "completed"
    t.bigint "company_id"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "can_accept"
    t.string "task_type"
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["proposal_id"], name: "index_tasks_on_proposal_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.string "activity_type"
    t.bigint "user_id"
    t.bigint "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "display_name"
    t.text "description"
    t.text "shot_preference", default: [], array: true
    t.text "content_type", default: [], array: true
    t.string "profile_photo"
    t.string "header_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "is_featured"
    t.boolean "premium"
    t.string "paypal_or_venmo"
    t.string "account_name"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
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
    t.string "name"
    t.integer "role"
    t.string "profile_image"
    t.string "user_type"
    t.bigint "company_id"
    t.boolean "intro_complete"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waitlists", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "instagram"
    t.string "px500"
    t.string "facebook"
    t.string "phone"
    t.string "website"
    t.string "smugmug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "question_1"
    t.text "question_2"
    t.text "question_3"
    t.text "question_4"
    t.text "question_5"
    t.text "question_6"
  end

  add_foreign_key "assistants", "locations"
  add_foreign_key "assistants", "proposals"
  add_foreign_key "chatrooms", "proposals"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collection_items", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "collections_tags", "collections"
  add_foreign_key "collections_tags", "tags"
  add_foreign_key "locations_tags", "locations"
  add_foreign_key "locations_tags", "tags"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "proposal_requests", "proposals"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "locations"
  add_foreign_key "proposals", "users"
  add_foreign_key "schedule_items", "locations"
  add_foreign_key "schedule_items", "users"
  add_foreign_key "shot_list_items", "proposals"
  add_foreign_key "shot_list_items", "tasks"
  add_foreign_key "tags_users", "tags"
  add_foreign_key "tags_users", "users"
  add_foreign_key "tasks", "companies"
  add_foreign_key "tasks", "proposals"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_activities", "users"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "companies"
end
