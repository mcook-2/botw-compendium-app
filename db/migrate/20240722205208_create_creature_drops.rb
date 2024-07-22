class CreateCreatureDrops < ActiveRecord::Migration[7.1]
  def change
    create_table :creature_drops do |t|
      t.references :creature, null: false, foreign_key: true
      t.references :drop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
