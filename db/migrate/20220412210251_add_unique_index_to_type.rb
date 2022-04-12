class AddUniqueIndexToType < ActiveRecord::Migration[7.0]
  def change
    add_index :types, :name, unique: true
  end
end
