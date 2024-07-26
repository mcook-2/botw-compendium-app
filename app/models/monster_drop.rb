class MonsterDrop < ApplicationRecord
  belongs_to :monster
  belongs_to :drop

  validates :monster_id, :location_id, presence: true
end
