class CreateDrops < ActiveRecord::Migration[7.1]
  def change
    create_table :drops do |t|
      t.string :name

      t.timestamps
    end
  end
end
