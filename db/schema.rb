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

ActiveRecord::Schema.define(version: 20170518000070) do

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.integer "addressable_id"
    t.string "name"
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.text "verification_info"
    t.text "original_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "families", force: :cascade do |t|
    t.integer "family_group_id"
    t.integer "order_pickup_schedule_id"
    t.integer "producer_entity_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_group_id"], name: "index_families_on_family_group_id"
    t.index ["order_pickup_schedule_id"], name: "index_families_on_order_pickup_schedule_id"
    t.index ["producer_entity_id"], name: "index_families_on_producer_entity_id"
  end

  create_table "family_groups", force: :cascade do |t|
    t.integer "producer_entity_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_entity_id"], name: "index_family_groups_on_producer_entity_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "label"
    t.string "image_svg_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.integer "food_category_id"
    t.integer "producer_entity_id"
    t.string "name"
    t.string "unit_label_singular"
    t.string "unit_label_plural"
    t.text "description"
    t.string "ingredients"
    t.string "image"
    t.integer "availability_start_month"
    t.integer "availability_start_day"
    t.integer "availability_end_month"
    t.integer "availability_end_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_category_id"], name: "index_food_items_on_food_category_id"
    t.index ["producer_entity_id"], name: "index_food_items_on_producer_entity_id"
  end

  create_table "order_pickup_schedules", force: :cascade do |t|
    t.integer "producer_entity_id"
    t.integer "sale_start_day_of_week"
    t.integer "sale_start_hour"
    t.integer "sale_start_minute"
    t.integer "sale_end_day_of_week"
    t.integer "sale_end_hour"
    t.integer "sale_end_minute"
    t.integer "pickup_day_of_week"
    t.integer "pickup_start_hour"
    t.integer "pickup_start_minute"
    t.integer "pickup_end_hour"
    t.integer "pickup_end_minute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_entity_id"], name: "index_order_pickup_schedules_on_producer_entity_id"
  end

  create_table "order_sellable_food_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "sellable_food_item_id"
    t.integer "quantity"
    t.float "unit_cost"
    t.index ["order_id"], name: "index_order_sellable_food_items_on_order_id"
    t.index ["sellable_food_item_id"], name: "index_order_sellable_food_items_on_sellable_food_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_pickup_schedule_id"
    t.float "total_cost"
    t.datetime "datetime_placed"
    t.datetime "next_sale_start_datetime"
    t.datetime "next_pickup_date"
    t.string "formatted_pickup_time"
    t.string "pickup_location_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_pickup_schedule_id"], name: "index_orders_on_order_pickup_schedule_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "producer_entities", force: :cascade do |t|
    t.string "name"
    t.string "web_site_url"
    t.string "offerings"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellable_food_items", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "wholeseller_id"
    t.integer "food_item_id"
    t.float "unit_cost"
    t.float "wholeseller_unit_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_sellable_food_items_on_food_item_id"
    t.index ["seller_id"], name: "index_sellable_food_items_on_seller_id"
    t.index ["wholeseller_id"], name: "index_sellable_food_items_on_wholeseller_id"
  end

  create_table "service_days", force: :cascade do |t|
    t.integer "producer_entity_id"
    t.date "service_date"
    t.text "description"
    t.string "signup_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producer_entity_id"], name: "index_service_days_on_producer_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "family_id"
    t.integer "producer_entity_id"
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.float "balance", default: 0.0
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["producer_entity_id"], name: "index_users_on_producer_entity_id"
  end

end
