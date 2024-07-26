class EquipmentLocation < ApplicationRecord
  belongs_to :equipment
  belongs_to :location

  validates :equipment_id, :location_id, presence: true
end
