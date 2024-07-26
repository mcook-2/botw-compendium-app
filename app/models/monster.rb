class Monster < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end
