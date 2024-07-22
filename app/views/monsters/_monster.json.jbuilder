json.extract! monster, :id, :name, :description, :image_url, :dlc, :created_at, :updated_at
json.url monster_url(monster, format: :json)
