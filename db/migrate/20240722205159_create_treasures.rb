class CreateTreasures < ActiveRecord::Migration[7.1]
  def change
    create_table :treasures do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.boolean :dlc

      t.timestamps
    end
  end
end
