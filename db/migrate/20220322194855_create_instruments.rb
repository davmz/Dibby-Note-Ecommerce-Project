class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.decimal :price
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
