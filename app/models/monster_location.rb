class MonsterLocation < ApplicationRecord
  belongs_to :monster
  belongs_to :location

  validates :monster_id, :location_id, presence: true
end
