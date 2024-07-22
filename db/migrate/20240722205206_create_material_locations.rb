class CreateMaterialLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :material_locations do |t|
      t.references :material, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
