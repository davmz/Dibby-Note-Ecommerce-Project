class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.decimal :totalprice
      t.decimal :taxprice
      t.references :user, null: false, foreign_key: true
      t.references :instrumentcart, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
