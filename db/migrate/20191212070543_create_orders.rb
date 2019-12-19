class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.text :address
      t.integer :status

      t.timestamps
    end
  end
end
