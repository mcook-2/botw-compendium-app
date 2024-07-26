require 'httparty'

class BotwApiService
  include HTTParty
  base_uri 'https://botw-compendium.herokuapp.com/api/v3/compendium'

  def fetch_monsters
    fetch_data('/category/monsters')
  end

  def fetch_equipment
    fetch_data('/category/equipment')
  end

  def fetch_materials
    fetch_data('/category/materials')
  end

  def fetch_creatures
    fetch_data('/category/creatures')
  end

  def fetch_treasures
    fetch_data('/category/treasures')
  end

  def extract_common_locations
    response = self.class.get('/', query: { game: 'botw' })
    all_common_locations = []

    if response.success?
      entries = JSON.parse(response.body)

      # Check if 'data' is an array before iterating
      if entries['data'].is_a?(Array)
        entries['data'].each do |item|
          all_common_locations.concat(item['common_locations']) if item['common_locations']
        end
      else
        puts "Warning: 'data' is not an array or is missing"
      end
    else
      # Handle the error case, e.g., logging, raising an error, etc.
      puts "Error: Unable to fetch data from the API"
    end

    # Remove duplicates if needed
    all_common_locations.uniq!

    # Return the result
    all_common_locations
  end

  def extract_drops
    response = self.class.get('/category/equipment', query: { game: 'botw' })
    all_drops = []

    if response.success?
      entries = JSON.parse(response.body)

      # Check if 'data' is an array before iterating
      if entries['data'].is_a?(Array)
        entries['data'].each do |item|
          all_drops.concat(item['drops']) if item['drops']
        end
      else
        puts "Warning: 'data' is not an array or is missing"
      end
    else
      # Handle the error case, e.g., logging, raising an error, etc.
      puts "Error: Unable to fetch data from the API"
    end

    # Remove duplicates if needed
    all_drops.uniq!

    # Return the result
    all_drops
  end

  def extract_equipment_properties
    response = self.class.get('/category/equipment', query: { game: 'botw' })
    all_equipment_properties = []

    if response.success?
      entries = JSON.parse(response.body)

      # Check if 'data' is an array before iterating
      if entries['data'].is_a?(Array)
        entries['data'].each do |item|
          # Extract the properties you need
          equipment_properties = {
            id: item['id'],
            properties: {
              attack: item['properties']&.dig('attack'),
              defense: item['properties']&.dig('defense')
            }
          }
          all_equipment_properties << equipment_properties
        end
      else
        puts "Warning: 'data' is not an array or is missing"
      end
    else
      # Handle the error case, e.g., logging, raising an error, etc.
      puts "Error: Unable to fetch data from the API"
    end

    # Return the result
    all_equipment_properties
  end

  private

  def fetch_data(endpoint)
    response = self.class.get(endpoint, query: { game: 'botw' })

    if response.success?
      entries = JSON.parse(response.body)['data']
      entries.map { |entry| parse_entry(entry) }
    else
      # Handle the error case, e.g., logging, raising an error, etc.
      []
    end
  end


  def parse_entry(entry)
    case entry['category']
    when 'monsters'
      parse_monster(entry)
    when 'equipment'
      parse_equipment(entry)
    when 'materials'
      parse_material(entry)
    when 'creatures'
      parse_creature(entry)
    when 'treasure'
      parse_treasure(entry)
    else

      # Handle unrecognized categories if any
      {}
    end
  end

  def parse_monster(entry)
    {
      name: entry['name'],
      id: entry['id'],
      description: entry['description'],
      image_url: entry['image'],
      common_locations: entry['common_locations'],
      drops: entry['drops'],
      dlc: entry['dlc']
    }
  end

  def parse_equipment(entry)
    {
      name: entry['name'],
      id: entry['id'],
      description: entry['description'],
      image_url: entry['image'],
      common_locations: entry['common_locations'],
      properties: {
        attack: entry['properties']&.dig('attack'),
        defense: entry['properties']&.dig('defense')
      },
      dlc: entry['dlc']
    }
  end

  def parse_material(entry)
    {
      name: entry['name'],
      id: entry['id'],
      description: entry['description'],
      image_url: entry['image'],
      common_locations: entry['common_locations'],
      hearts_recovered: entry['hearts_recovered'],
      cooking_effect: entry['cooking_effect'],
      dlc: entry['dlc']
    }
  end

  def parse_creature(entry)
    if entry['edible']
      {
        name: entry['name'],
        id: entry['id'],
        description: entry['description'],
        image_url: entry['image'],
        common_locations: entry['common_locations'],
        edible: true,
        hearts_recovered: entry['hearts_recovered'],
        cooking_effect: entry['cooking_effect'],
        dlc: entry['dlc']
      }
    else
      {
        name: entry['name'],
        id: entry['id'],
        description: entry['description'],
        image_url: entry['image'],
        common_locations: entry['common_locations'],
        edible: false,
        drops: entry['drops'],
        dlc: entry['dlc']
      }
    end
  end

  def parse_treasure(entry)
    {
      name: entry['name'],
      id: entry['id'],
      description: entry['description'],
      image_url: entry['image'],
      common_locations: entry['common_locations'],
      drops: entry['drops'],
      dlc: entry['dlc']
    }
  end

end
