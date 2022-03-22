class CreateInstrumentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_types do |t|
      t.references :type, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
