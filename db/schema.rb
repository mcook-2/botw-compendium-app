# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_22_205210) do
  create_table "creature_drops", force: :cascade do |t|
    t.integer "creature_id", null: false
    t.integer "drop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creature_id"], name: "index_creature_drops_on_creature_id"
    t.index ["drop_id"], name: "index_creature_drops_on_drop_id"
  end

  create_table "creature_locations", force: :cascade do |t|
    t.integer "creature_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creature_id"], name: "index_creature_locations_on_creature_id"
    t.index ["location_id"], name: "index_creature_locations_on_location_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.boolean "edible"
    t.integer "hearts_recovered"
    t.string "cooking_effect"
    t.boolean "dlc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.boolean "dlc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_locations", force: :cascade do |t|
    t.integer "equipment_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_equipment_locations_on_equipment_id"
    t.index ["location_id"], name: "index_equipment_locations_on_location_id"
  end

  create_table "equipment_properties", force: :cascade do |t|
    t.integer "equipment_id", null: false
    t.integer "attack"
    t.integer "defense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_equipment_properties_on_equipment_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_locations", force: :cascade do |t|
    t.integer "material_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_material_locations_on_location_id"
    t.index ["material_id"], name: "index_material_locations_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.integer "hearts_recovered"
    t.string "cooking_effect"
    t.boolean "dlc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_drops", force: :cascade do |t|
    t.integer "monster_id", null: false
    t.integer "drop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drop_id"], name: "index_monster_drops_on_drop_id"
    t.index ["monster_id"], name: "index_monster_drops_on_monster_id"
  end

  create_table "monster_locations", force: :cascade do |t|
    t.integer "monster_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_monster_locations_on_location_id"
    t.index ["monster_id"], name: "index_monster_locations_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.boolean "dlc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treasure_drops", force: :cascade do |t|
    t.integer "treasure_id", null: false
    t.integer "drop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drop_id"], name: "index_treasure_drops_on_drop_id"
    t.index ["treasure_id"], name: "index_treasure_drops_on_treasure_id"
  end

  create_table "treasure_locations", force: :cascade do |t|
    t.integer "treasure_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_treasure_locations_on_location_id"
    t.index ["treasure_id"], name: "index_treasure_locations_on_treasure_id"
  end

  create_table "treasures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.boolean "dlc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "creature_drops", "creatures"
  add_foreign_key "creature_drops", "drops"
  add_foreign_key "creature_locations", "creatures"
  add_foreign_key "creature_locations", "locations"
  add_foreign_key "equipment_locations", "equipment"
  add_foreign_key "equipment_locations", "locations"
  add_foreign_key "equipment_properties", "equipment"
  add_foreign_key "material_locations", "locations"
  add_foreign_key "material_locations", "materials"
  add_foreign_key "monster_drops", "drops"
  add_foreign_key "monster_drops", "monsters"
  add_foreign_key "monster_locations", "locations"
  add_foreign_key "monster_locations", "monsters"
  add_foreign_key "treasure_drops", "drops"
  add_foreign_key "treasure_drops", "treasures"
  add_foreign_key "treasure_locations", "locations"
  add_foreign_key "treasure_locations", "treasures"
end
