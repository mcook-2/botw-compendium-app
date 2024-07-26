class Material < ApplicationRecord
  validates :id, presence: true, uniqueness: true

  has_many :material_locations, dependent: :destroy
  has_many :locations, through: :material_locations

  validates :name, :description, :image_url, presence: true
  validates :dlc, inclusion: { in: [true, false] }
end
