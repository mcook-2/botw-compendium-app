class Equipment < ApplicationRecord
  validates :id, presence: true, uniqueness: true

  has_many :equipment_locations, dependent: :destroy
  has_many :locations, through: :equipment_locations
  has_many :equipment_properties, dependent: :destroy

  validates :name, :description, :image_url, presence: true
  validates :dlc, inclusion: { in: [true, false] }
end
