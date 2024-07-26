class Treasure < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end
