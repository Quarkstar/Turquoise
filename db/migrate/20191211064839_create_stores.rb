class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :info
      t.string :tel

      t.timestamps
    end
  end
end
