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

ActiveRecord::Schema.define(version: 20191228034403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adlib_answers", force: :cascade do |t|
    t.string "contact"
    t.text "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "facebook"
    t.string "instagram"
    t.text "notes"
    t.bigint "shoot_id"
    t.index ["location_id"], name: "index_assistants_on_location_id"
    t.index ["proposal_id"], name: "index_assistants_on_proposal_id"
    t.index ["shoot_id"], name: "index_assistants_on_shoot_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "topic"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shoot_id"
    t.index ["proposal_id"], name: "index_chatrooms_on_proposal_id"
    t.index ["shoot_id"], name: "index_chatrooms_on_shoot_id"
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

  create_table "creative_requests", force: :cascade do |t|
    t.bigint "shoot_id"
    t.bigint "requested_by_id"
    t.bigint "creative_id"
    t.bigint "company_id"
    t.boolean "accepted"
    t.date "accepted_on"
    t.date "deadline"
    t.boolean "approved"
    t.boolean "declined"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_creative_requests_on_company_id"
    t.index ["shoot_id"], name: "index_creative_requests_on_shoot_id"
  end

  create_table "discount_codes", force: :cascade do |t|
    t.string "code"
    t.string "discount_type"
    t.date "expiration_date"
    t.integer "max_uses"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "stackable"
  end

  create_table "discount_codes_projects", id: false, force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "discount_code_id"
    t.index ["discount_code_id"], name: "index_discount_codes_projects_on_discount_code_id"
    t.index ["project_id"], name: "index_discount_codes_projects_on_project_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "assistant_id"
    t.string "title"
    t.string "file"
    t.string "media"
    t.string "document_type"
    t.boolean "is_template"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shoot_id"
    t.index ["assistant_id"], name: "index_documents_on_assistant_id"
    t.index ["company_id"], name: "index_documents_on_company_id"
    t.index ["proposal_id"], name: "index_documents_on_proposal_id"
    t.index ["shoot_id"], name: "index_documents_on_shoot_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "feed_items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "header_images", force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.boolean "homepage"
    t.boolean "showcase"
    t.boolean "creators"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headline_adlibs", force: :cascade do |t|
    t.string "title"
    t.integer "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "company_id"
    t.bigint "payment_id"
    t.decimal "amount"
    t.date "due_date"
    t.string "invoice_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_invoices_on_company_id"
    t.index ["payment_id"], name: "index_invoices_on_payment_id"
    t.index ["project_id"], name: "index_invoices_on_project_id"
  end

  create_table "lead_notes", force: :cascade do |t|
    t.text "note"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_lead_notes_on_lead_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "company_name"
    t.string "office_phone"
    t.string "cell_phone"
    t.date "last_contacted"
    t.date "next_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rep_id"
    t.time "next_contact_time"
    t.string "source"
    t.string "loaction"
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "title"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "address"
    t.string "phone"
    t.string "linked_in_id"
    t.string "profile_picture"
    t.string "summary"
    t.string "company_profile"
    t.string "company_website"
    t.string "twitter"
    t.string "instagram"
    t.string "industry"
    t.string "my_tags"
    t.string "my_notes"
    t.string "visit_time"
    t.string "linkedin_profile"
    t.string "picture"
    t.string "degree"
    t.string "middle_name"
    t.string "from"
    t.string "personal_website"
    t.string "im"
    t.string "location"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.string "location_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "package_types", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "description"
    t.string "description_image"
    t.string "example_image"
    t.string "example_video"
    t.bigint "header_image_id"
    t.boolean "show_in_menu"
    t.text "menu_link_text"
    t.integer "minimum_images"
    t.integer "minimum_videos"
    t.integer "max_models"
    t.decimal "base_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.text "example_image_description"
    t.text "example_video_description"
    t.string "example_video_thumbnail"
    t.boolean "show_on_index"
    t.text "call_to_action_text"
    t.boolean "add_default_shot_list"
    t.string "page_header"
    t.string "description_text_title"
    t.string "description_text_subtitle"
    t.string "example_image_title"
    t.string "example_image_subtitle"
    t.string "example_video_title"
    t.string "example_video_subtitle"
    t.string "slug"
    t.index ["header_image_id"], name: "index_package_types_on_header_image_id"
  end

  create_table "page_sections", force: :cascade do |t|
    t.bigint "page_id"
    t.string "title"
    t.text "content"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_sections_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "header_image"
    t.boolean "is_blog"
    t.text "status"
    t.string "slug"
    t.text "description"
    t.string "keywords"
    t.boolean "is_faq"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.string "payment_type"
    t.string "category"
    t.string "payment_method"
    t.string "external_id"
    t.date "paid_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.index ["project_id"], name: "index_payments_on_project_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "package_type_id"
    t.bigint "company_id"
    t.string "title"
    t.text "brief"
    t.date "deadline"
    t.decimal "price"
    t.decimal "deposit"
    t.decimal "balance"
    t.boolean "is_complete"
    t.date "completed_on"
    t.integer "max_user_shot_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_template"
    t.boolean "is_default_template"
    t.string "mood"
    t.string "image_board_1"
    t.string "image_board_2"
    t.string "image_board_3"
    t.string "image_board_4"
    t.string "insta_inspiration_1"
    t.string "insta_inspiration_2"
    t.string "insta_inspiration_3"
    t.string "insta_inspiration_4"
    t.index ["company_id"], name: "index_projects_on_company_id"
    t.index ["package_type_id"], name: "index_projects_on_package_type_id"
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

  create_table "shoots", force: :cascade do |t|
    t.bigint "creative_id"
    t.bigint "project_id"
    t.bigint "company_id"
    t.bigint "location_id"
    t.string "content_type"
    t.text "brief"
    t.string "time_of_day"
    t.string "bts"
    t.decimal "price"
    t.string "background"
    t.string "background_note"
    t.string "shoot_style"
    t.boolean "shoot_raw"
    t.integer "user_added_shot_count"
    t.integer "user_added_shot_count_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "user_saved"
    t.string "focus_points", default: [], array: true
    t.date "deadline"
    t.boolean "is_complete"
    t.string "title"
    t.date "shoot_date"
    t.time "call_time"
    t.boolean "set_location_rental"
    t.decimal "rental_price"
    t.boolean "tranportation_required"
    t.string "address_or_landmark"
    t.string "set_contact_name"
    t.string "set_contact_phone"
    t.string "parking_details"
    t.text "rental_details"
    t.text "other_details"
    t.text "script"
    t.index ["company_id"], name: "index_shoots_on_company_id"
    t.index ["location_id"], name: "index_shoots_on_location_id"
    t.index ["project_id"], name: "index_shoots_on_project_id"
  end

  create_table "shot_list_item_templates", force: :cascade do |t|
    t.string "description"
    t.string "background"
    t.string "item_type"
    t.string "focus_point"
    t.string "reference_image"
    t.string "aspect_ratio"
    t.string "frame_rate"
    t.bigint "task_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_group_id"], name: "index_shot_list_item_templates_on_task_group_id"
  end

  create_table "shot_list_items", force: :cascade do |t|
    t.bigint "proposal_id"
    t.string "description"
    t.string "background"
    t.string "upload"
    t.string "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "focus_point"
    t.string "reference_image"
    t.string "aspect_ratio"
    t.bigint "shoot_id"
    t.bigint "added_by_id"
    t.string "shoot_location"
    t.string "frame_rate"
    t.bigint "task_group_id"
    t.index ["proposal_id"], name: "index_shot_list_items_on_proposal_id"
    t.index ["shoot_id"], name: "index_shot_list_items_on_shoot_id"
    t.index ["task_group_id"], name: "index_shot_list_items_on_task_group_id"
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

  create_table "showcase_videos", force: :cascade do |t|
    t.string "file"
    t.string "showcase_type"
    t.boolean "show"
    t.integer "order"
    t.string "title"
    t.text "description"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vimeo_link"
  end

  create_table "task_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "shoot_id"
    t.boolean "complete"
    t.bigint "approver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.boolean "is_template"
    t.string "shoot_type"
    t.bigint "parent_id"
    t.index ["shoot_id"], name: "index_task_groups_on_shoot_id"
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
    t.bigint "shoot_id"
    t.bigint "project_id"
    t.boolean "is_template"
    t.bigint "shot_list_item_id"
    t.bigint "task_group_id"
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["proposal_id"], name: "index_tasks_on_proposal_id"
    t.index ["shoot_id"], name: "index_tasks_on_shoot_id"
    t.index ["shot_list_item_id"], name: "index_tasks_on_shot_list_item_id"
    t.index ["task_group_id"], name: "index_tasks_on_task_group_id"
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
  add_foreign_key "assistants", "shoots"
  add_foreign_key "chatrooms", "proposals"
  add_foreign_key "chatrooms", "shoots"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collection_items", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "creative_requests", "companies"
  add_foreign_key "creative_requests", "shoots"
  add_foreign_key "discount_codes_projects", "discount_codes"
  add_foreign_key "discount_codes_projects", "projects"
  add_foreign_key "documents", "assistants"
  add_foreign_key "documents", "companies"
  add_foreign_key "documents", "proposals"
  add_foreign_key "documents", "shoots"
  add_foreign_key "documents", "users"
  add_foreign_key "invoices", "companies"
  add_foreign_key "invoices", "payments"
  add_foreign_key "invoices", "projects"
  add_foreign_key "lead_notes", "leads"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "package_types", "header_images"
  add_foreign_key "page_sections", "pages"
  add_foreign_key "payments", "projects"
  add_foreign_key "payments", "users"
  add_foreign_key "projects", "companies"
  add_foreign_key "projects", "package_types"
  add_foreign_key "proposal_requests", "proposals"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "locations"
  add_foreign_key "proposals", "users"
  add_foreign_key "schedule_items", "locations"
  add_foreign_key "schedule_items", "users"
  add_foreign_key "shoots", "companies"
  add_foreign_key "shoots", "locations"
  add_foreign_key "shoots", "projects"
  add_foreign_key "shot_list_item_templates", "task_groups"
  add_foreign_key "shot_list_items", "proposals"
  add_foreign_key "shot_list_items", "shoots"
  add_foreign_key "shot_list_items", "task_groups"
  add_foreign_key "task_groups", "shoots"
  add_foreign_key "tasks", "companies"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "proposals"
  add_foreign_key "tasks", "shoots"
  add_foreign_key "tasks", "task_groups"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_activities", "users"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "companies"
end
