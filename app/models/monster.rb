class Monster < ApplicationRecord
  validates :id, presence: true, uniqueness: true

  has_many :monster_locations, dependent: :destroy
  has_many :locations, through: :monster_locations
  has_many :monster_drops, dependent: :destroy
  has_many :drops, through: :monster_drops

  validates :name, :description, :image_url, presence: true
  validates :dlc, inclusion: { in: [true, false] }
end
