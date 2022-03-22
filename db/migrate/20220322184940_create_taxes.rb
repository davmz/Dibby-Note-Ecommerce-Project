class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.decimal :pst
      t.decimal :gst
      t.decimal :hst
      t.decimal :totaltax
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
