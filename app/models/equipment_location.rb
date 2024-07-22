class EquipmentLocation < ApplicationRecord
  belongs_to :equipment
  belongs_to :location
end
