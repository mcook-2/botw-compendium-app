class TreasureLocation < ApplicationRecord
  belongs_to :treasure
  belongs_to :location

  validates :treasure_id, :location_id, presence: true
end
