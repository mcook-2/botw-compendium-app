class CreateTreasureLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :treasure_locations do |t|
      t.references :treasure, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
