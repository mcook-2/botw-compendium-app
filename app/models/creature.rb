class Creature < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end
