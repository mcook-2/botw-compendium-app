class MonsterLocation < ApplicationRecord
  belongs_to :monster
  belongs_to :location
end
