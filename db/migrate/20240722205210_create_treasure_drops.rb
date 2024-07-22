class CreateTreasureDrops < ActiveRecord::Migration[7.1]
  def change
    create_table :treasure_drops do |t|
      t.references :treasure, null: false, foreign_key: true
      t.references :drop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
