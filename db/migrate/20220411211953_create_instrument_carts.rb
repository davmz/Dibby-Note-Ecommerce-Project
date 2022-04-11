class CreateInstrumentCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_carts do |t|
      t.decimal :price
      t.integer :quantity
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
