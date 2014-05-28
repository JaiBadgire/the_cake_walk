class CreateCakestores < ActiveRecord::Migration
  def change
    create_table :cakestores do |t|
      t.string :cake_name
      t.text :description
      t.integer :cake_weight
      t.integer :price
      t.integer :quantity
      t.string :occasion
      t.attachment :image

      t.timestamps
    end
  end
end
