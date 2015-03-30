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

ActiveRecord::Schema.define(version: 20150125154420) do

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "level",      default: 1
    t.integer  "pv",         default: 0
    t.integer  "atk",        default: 0
    t.integer  "def",        default: 0
    t.integer  "exp",        default: 0
    t.integer  "skill",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "current_quests", force: :cascade do |t|
    t.integer  "character",  default: 0
    t.integer  "quest",      default: 0
    t.integer  "stat",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "item_id"
    t.integer  "equip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "inventories", ["character_id"], name: "index_inventories_on_character_id"
  add_index "inventories", ["item_id"], name: "index_inventories_on_item_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "pv",         default: 0
    t.integer  "atk",        default: 0
    t.integer  "def",        default: 0
    t.integer  "slot",       default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "npcs", force: :cascade do |t|
    t.string   "name"
    t.integer  "level",      default: 1
    t.integer  "pv",         default: 0
    t.integer  "atk",        default: 0
    t.integer  "def",        default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "quest_id"
    t.string   "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["quest_id"], name: "index_questions_on_quest_id"

  create_table "quests", force: :cascade do |t|
    t.integer  "npc_id"
    t.string   "name"
    t.integer  "next",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "quests", ["npc_id"], name: "index_quests_on_npc_id"

  create_table "replies", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "reply"
    t.integer  "bool"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "replies", ["question_id"], name: "index_replies_on_question_id"

  create_table "rewards", force: :cascade do |t|
    t.integer  "quest_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rewards", ["item_id"], name: "index_rewards_on_item_id"
  add_index "rewards", ["quest_id"], name: "index_rewards_on_quest_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "password",               null: false
    t.string   "salt",                   null: false
    t.integer  "role",       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
