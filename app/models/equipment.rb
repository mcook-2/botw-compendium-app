class Equipment < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end
