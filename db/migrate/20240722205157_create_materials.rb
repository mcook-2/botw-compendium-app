class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :hearts_recovered
      t.string :cooking_effect
      t.boolean :dlc

      t.timestamps
    end
  end
end
