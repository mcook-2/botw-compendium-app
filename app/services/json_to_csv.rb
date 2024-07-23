require 'csv'
require 'json'

json_data = [
  {
    "category" => "treasure",
    "common_locations" => ["Greater Hyrule"],
    "description" => "This deposit contains a good deal of precious ore and the occasional rare mineral, like ruby and sapphire. Break it open to see what it has to offer!",
    "dlc" => false,
    "drops" => ["ruby", "sapphire", "diamond", "amber", "topaz", "flint"],
    "id" => 388,
    "image" => "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/rare_ore_deposit/image",
    "name" => "rare ore deposit"
  },
  {
    "category" => "treasure",
    "common_locations" => ["Greater Hyrule"],
    "description" => "This deposit contains a good deal of ore. Breaking the rock will yield rock salt, flint, and other minerals of varying value.",
    "dlc" => false,
    "drops" => ["ruby", "diamond", "amber", "sapphire", "topaz", "opal", "rock salt", "flint"],
    "id" => 387,
    "image" => "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/ore_deposit/image",
    "name" => "ore deposit"
  },
  {
    "category" => "treasure",
    "common_locations" => ["Greater Hyrule"],
    "description" => "Fortunes untold (potentially) await the lucky adventurer who finds one of these. Chests can often be found within shrines or at enemy camps, but there may be some crafty folks who think they're safer underground.",
    "dlc" => false,
    "drops" => ["treasures"],
    "id" => 386,
    "image" => "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/treasure_chest/image",
    "name" => "treasure chest"
  },
  {
    "category" => "treasure",
    "common_locations" => ["Greater Hyrule"],
    "description" => "This deposit contains quite a bit of luminous stone. Crack it open to get at the easily process rocks within.",
    "dlc" => false,
    "drops" => ["luminous", "flint"],
    "id" => 389,
    "image" => "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/luminous_ore_deposit/image",
    "name" => "luminous ore deposit"
  },
]

# Convert JSON to CSV
CSV.open('data.csv', 'w') do |csv|
  # headers
  csv << ['Category', 'Name', 'Description', 'Image URL', 'Common Locations', 'Drops', 'DLC', 'ID']

  # Write data rows
  json_data.each do |item|
    csv << [
      item['category'] || 'N/A',
      item['name'] || 'N/A',
      item['description'] || 'N/A',
      item['image'] || 'N/A',
      (item['common_locations'] || []).join('; '),
      (item['drops'] || []).join('; '),
      item['dlc'].nil? ? 'N/A' : item['dlc'].to_s,
      item['id'] || 'N/A'
    ]
  end
end

puts "Data has been exported to data.csv"
