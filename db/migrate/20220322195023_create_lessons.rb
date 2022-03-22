class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.decimal :price
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
