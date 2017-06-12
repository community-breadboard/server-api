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

ActiveRecord::Schema.define(version: 20170525184958) do

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.integer "addressable_id"
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
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_group_id"], name: "index_families_on_family_group_id"
  end

  create_table "family_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "label"
    t.string "image_svg_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.string "unit_label_singular"
    t.string "unit_label_plural"
    t.float "unit_cost"
    t.text "description"
    t.string "ingredients"
    t.string "image"
    t.integer "availability_start_month"
    t.integer "availability_start_day"
    t.integer "availability_end_month"
    t.integer "availability_end_day"
    t.integer "food_category_id"
    t.integer "producer_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_category_id"], name: "index_food_items_on_food_category_id"
    t.index ["producer_entity_id"], name: "index_food_items_on_producer_entity_id"
  end

  create_table "order_food_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "food_item_id"
    t.integer "quantity"
    t.float "unit_cost"
    t.index ["food_item_id"], name: "index_order_food_items_on_food_item_id"
    t.index ["order_id"], name: "index_order_food_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.float "total_cost"
    t.string "status"
    t.date "order_start_date"
    t.date "order_end_date"
    t.date "pickup_start_date"
    t.date "pickup_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "producer_entities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_aggregator", default: false
    t.string "sale_start_day_of_week"
    t.integer "sale_start_hour"
    t.integer "sale_start_minute"
    t.string "sale_end_day_of_week"
    t.integer "sale_end_hour"
    t.integer "sale_end_minute"
    t.string "pickup_start_day_of_week"
    t.integer "pickup_start_hour"
    t.integer "pickup_start_minute"
    t.string "pickup_end_day_of_week"
    t.integer "pickup_end_hour"
    t.integer "pickup_end_minute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "family_id"
    t.integer "producer_entity_id"
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.float "balance"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["producer_entity_id"], name: "index_users_on_producer_entity_id"
  end

end
