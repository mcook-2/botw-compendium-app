class CreatureLocation < ApplicationRecord
  belongs_to :creature
  belongs_to :location
end
