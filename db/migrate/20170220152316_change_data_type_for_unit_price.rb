class ChangeDataTypeForUnitPrice < ActiveRecord::Migration[5.0]
  def change
    change_column :stocks, :unit_price, :float
  end
end
