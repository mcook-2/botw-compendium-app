class TreasureLocation < ApplicationRecord
  belongs_to :treasure
  belongs_to :location
end
