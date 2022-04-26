class CreateInstrumentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_items do |t|
      t.decimal :unitprice
      t.integer :quantity
      t.decimal :total_price
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
