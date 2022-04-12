class AddIndexToProvincesName < ActiveRecord::Migration[7.0]
  def change
    add_index :provinces, :name, unique: true
  end
end
