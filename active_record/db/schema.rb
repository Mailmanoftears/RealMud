# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_27_220221) do

  create_table "bots", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.integer "hitpoints"
    t.integer "strength"
    t.integer "x_coord", default: 0
    t.integer "y_coord", default: 0
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.string "discipline"
    t.integer "hitpoints"
    t.integer "strength"
    t.integer "stealth", default: 0
    t.integer "psionics", default: 0
    t.integer "rage", default: 0
    t.integer "agility", default: 0
    t.integer "defense", default: 0
    t.integer "perception", default: 0
    t.integer "constitution", default: 0
    t.integer "level", default: 0
    t.integer "exp", default: 0
    t.integer "x_coord", default: 0
    t.integer "y_coord", default: 0
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
    t.integer "bot_id"
    t.index ["bot_id"], name: "index_inventories_on_bot_id"
    t.index ["character_id"], name: "index_inventories_on_character_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inventory_id"
    t.integer "map_tile_id"
    t.integer "shop_id"
    t.index ["inventory_id"], name: "index_inventory_items_on_inventory_id"
    t.index ["map_tile_id"], name: "index_inventory_items_on_map_tile_id"
    t.index ["shop_id"], name: "index_inventory_items_on_shop_id"
  end

  create_table "map_tiles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "x_coord"
    t.integer "y_coord"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "hitpoints"
    t.integer "strength"
    t.integer "x_coord", default: 0
    t.integer "y_coord", default: 0
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "description"
    t.integer "strength"
    t.integer "x_coord", default: 0
    t.integer "y_coord", default: 0
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
    t.index ["character_id"], name: "index_pets_on_character_id"
  end

  create_table "quest_masters", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.integer "x_coord", default: 0
    t.integer "y_coord", default: 0
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quest_id"
    t.index ["quest_id"], name: "index_quest_masters_on_quest_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.integer "length_in_minutes"
    t.integer "reward_in_exp"
    t.string "description"
    t.boolean "solved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopkeepers", force: :cascade do |t|
    t.string "name"
    t.string "greeting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.index ["shop_id"], name: "index_shopkeepers_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "map_tile_id"
    t.index ["map_tile_id"], name: "index_shops_on_map_tile_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.integer "amount"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inventory_id"
    t.integer "map_tile_id"
    t.integer "shop_id"
    t.index ["inventory_id"], name: "index_weapons_on_inventory_id"
    t.index ["map_tile_id"], name: "index_weapons_on_map_tile_id"
    t.index ["shop_id"], name: "index_weapons_on_shop_id"
  end

  add_foreign_key "inventories", "bots"
  add_foreign_key "inventories", "characters"
  add_foreign_key "inventory_items", "inventories"
  add_foreign_key "inventory_items", "map_tiles"
  add_foreign_key "inventory_items", "shops"
  add_foreign_key "pets", "characters"
  add_foreign_key "quest_masters", "quests"
  add_foreign_key "shopkeepers", "shops"
  add_foreign_key "shops", "map_tiles"
  add_foreign_key "weapons", "inventories"
  add_foreign_key "weapons", "map_tiles"
  add_foreign_key "weapons", "shops"
end
