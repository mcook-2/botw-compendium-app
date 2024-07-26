class Material < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end
