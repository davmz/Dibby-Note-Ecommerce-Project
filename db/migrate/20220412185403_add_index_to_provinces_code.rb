class AddIndexToProvincesCode < ActiveRecord::Migration[7.0]
  def change
    add_index :provinces, :code, unique: true
  end
end
