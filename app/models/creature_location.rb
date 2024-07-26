class CreatureLocation < ApplicationRecord
  belongs_to :creature
  belongs_to :location

  validates :creature_id, :location_id, presence: true
end
