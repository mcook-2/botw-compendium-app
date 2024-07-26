class Creature < ApplicationRecord
  validates :id, presence: true, uniqueness: true

  has_many :creature_locations, dependent: :destroy
  has_many :locations, through: :creature_locations
  has_many :creature_drops, dependent: :destroy
  has_many :drops, through: :creature_drops

  validates :name, :description, :image_url, presence: true
  validates :dlc, inclusion: { in: [true, false] }
end
