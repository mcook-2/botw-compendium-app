require 'httparty'

class BotwApiService
  include HTTParty
  base_uri 'https://botw-compendium.herokuapp.com/api/v3/compendium'

  def Initialize()
    @locations_array =[]
    @drops_array = []
    @equipment_propteries_array = []

  end

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
      id_in_compendium: entry['id'],
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
      id_in_compendium: entry['id'],
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
      id_in_compendium: entry['id'],
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
        id_in_compendium: entry['id'],
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
        id_in_compendium: entry['id'],
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
      id_in_compendium: entry['id'],
      description: entry['description'],
      image_url: entry['image'],
      common_locations: entry['common_locations'],
      drops: entry['drops'],
      dlc: entry['dlc']
    }
  end

end
