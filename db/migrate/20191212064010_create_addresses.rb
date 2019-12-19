class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.string :tel

      t.timestamps
    end
  end
end
