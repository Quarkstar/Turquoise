class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :store, foreign_key: true
      t.string :name
      t.string :category
      t.text :info
      t.string :picture
      t.integer :price

      t.timestamps
    end
  end
end
