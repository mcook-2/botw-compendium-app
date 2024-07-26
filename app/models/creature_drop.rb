class CreatureDrop < ApplicationRecord
  belongs_to :creature
  belongs_to :drop

  validates :creature_id, :drop_id, presence: true
end
