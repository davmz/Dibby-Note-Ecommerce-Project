class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.decimal :subtotal
      t.decimal :total
      t.decimal :tax
      t.references :user, null: false, foreign_key: true
      t.references :instrument_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
