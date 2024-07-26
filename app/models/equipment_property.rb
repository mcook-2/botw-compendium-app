class EquipmentProperty < ApplicationRecord
  belongs_to :equipment

  validates :equipment_id, presence: true
  validates :attack, numericality: { only_integer: true, allow_nil: true }
  validates :defense, numericality: { only_integer: true, allow_nil: true }
end
