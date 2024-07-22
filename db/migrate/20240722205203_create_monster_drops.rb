class CreateMonsterDrops < ActiveRecord::Migration[7.1]
  def change
    create_table :monster_drops do |t|
      t.references :monster, null: false, foreign_key: true
      t.references :drop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
