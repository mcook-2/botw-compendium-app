class CreateMonsterLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :monster_locations do |t|
      t.references :monster, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
