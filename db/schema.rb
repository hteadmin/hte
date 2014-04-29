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

ActiveRecord::Schema.define(version: 20140424084444) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "blog_articles", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_articles", ["category_id"], name: "index_blog_articles_on_category_id", using: :btree

  create_table "blog_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "quantity"
    t.integer  "price"
    t.boolean  "primary",     default: false
    t.integer  "product_id"
    t.integer  "instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["instance_id"], name: "index_cart_items_on_instance_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: true do |t|
    t.string   "client_name"
    t.string   "phone"
    t.string   "email"
    t.string   "street"
    t.integer  "district_id"
    t.integer  "rental_weeks"
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  add_index "carts", ["district_id"], name: "index_carts_on_district_id", using: :btree

  create_table "contract_items", force: true do |t|
    t.integer  "order_item_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contract_items", ["inventory_item_id"], name: "index_contract_items_on_inventory_item_id", using: :btree
  add_index "contract_items", ["order_item_id"], name: "index_contract_items_on_order_item_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "trailer"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instance_games", force: true do |t|
    t.integer  "instance_id"
    t.integer  "game_id"
    t.boolean  "active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instance_games", ["game_id"], name: "index_instance_games_on_game_id", using: :btree
  add_index "instance_games", ["instance_id"], name: "index_instance_games_on_instance_id", using: :btree

  create_table "instances", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "slug"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instances", ["product_id"], name: "index_instances_on_product_id", using: :btree

  create_table "inventory_items", force: true do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "serial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.string   "name"
    t.integer  "quantity"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "number"
    t.string   "order_type"
    t.string   "client_name"
    t.string   "phone"
    t.string   "email"
    t.string   "street"
    t.integer  "district_id"
    t.integer  "rental_weeks"
    t.integer  "shipping_price"
    t.integer  "subtotal"
    t.integer  "total"
    t.string   "state",           default: "pending"
    t.string   "deposit_type"
    t.integer  "deposit_amount"
    t.string   "delivery_method"
    t.datetime "delivered_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  add_index "orders", ["district_id"], name: "index_orders_on_district_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "root_id"
    t.string   "name"
    t.string   "slug"
    t.integer  "price"
    t.integer  "sale_price"
    t.integer  "noc_price"
    t.integer  "cost"
    t.string   "unit"
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "active",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shippings", force: true do |t|
    t.string   "location"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
