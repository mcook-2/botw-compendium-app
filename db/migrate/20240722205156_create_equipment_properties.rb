class CreateEquipmentProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment_properties do |t|
      t.references :equipment, null: false, foreign_key: true
      t.integer :attack
      t.integer :defense

      t.timestamps
    end
  end
end
