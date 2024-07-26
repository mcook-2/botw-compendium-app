class Treasure < ApplicationRecord
  validates :id, presence: true, uniqueness: true

  has_many :treasure_locations, dependent: :destroy
  has_many :locations, through: :treasure_locations
  has_many :treasure_drops, dependent: :destroy
  has_many :drops, through: :treasure_drops

  validates :name, :description, :image_url, presence: true
  validates :dlc, inclusion: { in: [true, false] }
end
