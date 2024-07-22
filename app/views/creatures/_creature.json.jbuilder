json.extract! creature, :id, :name, :description, :image_url, :edible, :hearts_recovered, :cooking_effect, :dlc, :created_at, :updated_at
json.url creature_url(creature, format: :json)
