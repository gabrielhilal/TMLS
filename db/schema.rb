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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120221182016) do

  create_table "consignees", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postcode"
    t.string   "country"
    t.string   "contact"
    t.string   "email"
    t.string   "telephone"
    t.string   "terms"
    t.decimal  "discount",   :precision => 7, :scale => 2
    t.decimal  "returns",    :precision => 7, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "drops", :force => true do |t|
    t.date     "factory_date"
    t.date     "customer_date"
    t.integer  "consignee_id"
    t.integer  "order_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "factories", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "postcode"
    t.string   "country"
    t.string   "city"
    t.string   "telephone"
    t.string   "email"
    t.string   "contact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "colour"
    t.integer  "quantity"
    t.decimal  "customer_price", :precision => 7, :scale => 2
    t.decimal  "factory_price",  :precision => 7, :scale => 2
    t.string   "mda"
    t.string   "line_number"
    t.string   "customer_style"
    t.string   "lining"
    t.string   "sock"
    t.string   "binding"
    t.string   "metals"
    t.string   "sole"
    t.string   "heel"
    t.integer  "drop_id"
    t.integer  "style_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "number"
    t.date     "date"
    t.string   "currency"
    t.string   "comments"
    t.integer  "customer_id"
    t.integer  "factory_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "styles", :force => true do |t|
    t.string   "style"
    t.string   "construction"
    t.string   "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "department"
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
