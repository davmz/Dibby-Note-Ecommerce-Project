class AddUniqueIndexToProvince < ActiveRecord::Migration[7.0]
  def change
    add_index :provinces, :name, unique: true
    add_index :provinces, :code, unique: true
  end
end
