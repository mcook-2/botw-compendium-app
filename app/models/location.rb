class Location < ApplicationRecord
  has_many :creature_locations, dependent: :destroy
  has_many :creatures, through: :creature_locations

  has_many :equipment_locations, dependent: :destroy
  has_many :equipment, through: :equipment_locations

  has_many :material_locations, dependent: :destroy
  has_many :materials, through: :material_locations

  has_many :monster_locations, dependent: :destroy
  has_many :monsters, through: :monster_locations

  has_many :treasure_locations, dependent: :destroy
  has_many :treasures, through: :treasure_locations

  validates :name, presence: true
end
