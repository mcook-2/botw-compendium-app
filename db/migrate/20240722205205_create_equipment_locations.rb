class CreateEquipmentLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment_locations do |t|
      t.references :equipment, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
