class ChangeColumnsTypeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :apartments, :bedrooms, :float
    change_column :apartments, :bathrooms, :float
  end
end
