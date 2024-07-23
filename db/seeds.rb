# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'httparty'
require 'csv'
require_relative '../app/services/botw_api_service'

# Instantiate the service
service = BotwApiService.new

# Fetch and seed creatures
creatures_data = service.fetch_creatures
creatures_data.each do |creature|
  new_creature = Creature.create!(
    name: creature[:name],
    description: creature[:description],
    image_url: creature[:image_url],
    edible: creature[:edible],
    hearts_recovered: creature[:hearts_recovered],
    cooking_effect: creature[:cooking_effect],
    dlc: creature[:dlc]
  )

  # Seed common locations for creatures
  creature[:common_locations]&.each do |location|
    loc = Location.find_or_create_by!(name: location)
    CreatureLocation.create!(creature: new_creature, location: loc)
  end

  # Seed drops for creatures
  creature[:drops]&.each do |drop|
    drp = Drop.find_or_create_by!(name: drop)
    CreatureDrop.create!(creature: new_creature, drop: drp)
  end
end

# Fetch and seed materials
materials_data = service.fetch_materials
materials_data.each do |material|
  new_material = Material.create!(
    name: material[:name],
    description: material[:description],
    image_url: material[:image_url],
    hearts_recovered: material[:hearts_recovered],
    cooking_effect: material[:cooking_effect],
    dlc: material[:dlc]
  )

  # Seed common locations for materials
  material[:common_locations]&.each do |location|
    loc = Location.find_or_create_by!(name: location)
    MaterialLocation.create!(material: new_material, location: loc)
  end
end

# Fetch and seed monsters
monsters_data = service.fetch_monsters
monsters_data.each do |monster|
  new_monster = Monster.create!(
    name: monster[:name],
    description: monster[:description],
    image_url: monster[:image_url],
    dlc: monster[:dlc]
  )

  # Seed common locations for monsters
  monster[:common_locations]&.each do |location|
    loc = Location.find_or_create_by!(name: location)
    MonsterLocation.create!(monster: new_monster, location: loc)
  end

  # Seed drops for monsters
  monster[:drops]&.each do |drop|
    drp = Drop.find_or_create_by!(name: drop)
    MonsterDrop.create!(monster: new_monster, drop: drp)
  end
end

# Fetch and seed equipment
equipment_data = service.fetch_equipment
equipment_data.each do |equipment|
  new_equipment = Equipment.create!(
    name: equipment[:name],
    description: equipment[:description],
    image_url: equipment[:image_url],
    dlc: equipment[:dlc]
  )

  # Seed common locations for equipment
  equipment[:common_locations]&.each do |location|
    loc = Location.find_or_create_by!(name: location)
    EquipmentLocation.create!(equipment: new_equipment, location: loc)
  end

  # Seed properties for equipment
  EquipmentProperty.create!(
    equipment: new_equipment,
    attack: equipment[:properties][:attack],
    defense: equipment[:properties][:defense]
  )
end

csv_file = Rails.root.join('db/treasure_data.csv')

# Check if the file exists
if File.exist?(csv_file)
  # Read and parse CSV data
  csv_data = File.read(csv_file)
  treasures = CSV.parse(csv_data, headers: true, header_converters: :symbol)

  treasures.each do |treasure|
    # Debug output
    puts "Processing treasure: #{treasure[:name]}"

    # Create or find treasure
    new_treasure = Treasure.find_or_create_by!(id: treasure[:id]) do |t|
      t.name = treasure[:name]
      t.description = treasure[:description]
      t.image_url = treasure[:image_url]
      t.dlc = treasure[:dlc] == 'true'  # Convert string to boolean
    end

    # Seed common locations for treasures
    locations = treasure[:common_locations].to_s.split(';').map(&:strip)
    locations.each do |location|
      loc = Location.find_or_create_by!(name: location)
      TreasureLocation.find_or_create_by!(treasure: new_treasure, location: loc)
    end

    # Seed drops for treasures
    drops = treasure[:drops].to_s.split(';').map(&:strip)
    drops.each do |drop|
      drp = Drop.find_or_create_by!(name: drop)
      TreasureDrop.find_or_create_by!(treasure: new_treasure, drop: drp)
    end
  end
else
  puts "CSV file not found: #{csv_file}"
end