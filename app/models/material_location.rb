class MaterialLocation < ApplicationRecord
  belongs_to :material
  belongs_to :location

  validates :material_id, :location_id, presence: true
end
