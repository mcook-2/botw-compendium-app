class TreasureDrop < ApplicationRecord
  belongs_to :treasure
  belongs_to :drop

  validates :treasure_id, :drop_id, presence: true
end
