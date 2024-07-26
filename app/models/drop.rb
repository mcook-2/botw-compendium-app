class Drop < ApplicationRecord
  has_many :creature_drops, dependent: :destroy
  has_many :creatures, through: :creature_drops

  has_many :monster_drops, dependent: :destroy
  has_many :monsters, through: :monster_drops

  has_many :treasure_drops, dependent: :destroy
  has_many :treasures, through: :treasure_drops

  validates :name, presence: true
end
