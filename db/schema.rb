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

ActiveRecord::Schema.define(version: 20170722143705) do

  create_table "budgets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "title"
    t.decimal  "spending"
    t.decimal  "income"
    t.decimal  "saving"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "job"
    t.decimal  "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposed_incomes", force: :cascade do |t|
    t.string   "source"
    t.string   "comment"
    t.decimal  "amount"
    t.integer  "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_proposed_incomes_on_budget_id"
  end

  create_table "proposed_items", force: :cascade do |t|
    t.string   "name"
    t.string   "comment"
    t.decimal  "cost"
    t.integer  "quantity"
    t.string   "category"
    t.integer  "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "amount"
    t.index ["budget_id"], name: "index_proposed_items_on_budget_id"
  end

  create_table "user_items", force: :cascade do |t|
    t.string   "itemname"
    t.string   "storename"
    t.string   "shortdescription"
    t.integer  "quantity"
    t.decimal  "itemcost"
    t.decimal  "amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.         "user_id"
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "othernames"
    t.string   "occupation"
    t.date     "date_of_birth"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
    t.string   "unit"
  end

  create_table "wishlists", force: :cascade do |t|
    t.string   "itemname"
    t.string   "comment"
    t.decimal  "itemcost"
    t.integer  "quantity"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
