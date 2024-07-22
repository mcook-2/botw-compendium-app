class CreateCreatureLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :creature_locations do |t|
      t.references :creature, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
