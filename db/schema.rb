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

ActiveRecord::Schema.define(version: 2018_09_20_033339) do

  create_table "advertisers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "address"
    t.integer "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_advertisers_on_province_id"
  end

  create_table "advertises", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "width"
    t.integer "height"
    t.string "link"
    t.integer "target"
    t.integer "position"
    t.string "click"
    t.integer "order"
    t.integer "status"
    t.float "money"
    t.integer "advertiser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertiser_id"], name: "index_advertises_on_advertiser_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "index_status"
    t.string "menu_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "address"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.date "birth_day"
    t.string "email"
    t.integer "phone"
    t.string "address"
    t.integer "user_id"
    t.integer "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_customers_on_province_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "group_products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "content"
    t.integer "order"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "introduces", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "order"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "summary"
    t.text "detail"
    t.integer "view"
    t.integer "hot_view"
    t.integer "status"
    t.integer "type_new_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_new_id"], name: "index_news_on_type_new_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_money"
    t.date "date_time"
    t.integer "status"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "summary"
    t.float "price"
    t.float "price_discount"
    t.integer "status"
    t.integer "group_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_product_id"], name: "index_products_on_group_product_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "content"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_news", force: :cascade do |t|
    t.string "name"
    t.text "note"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_type_news_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
