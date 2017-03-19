class ChangeDataTypeForEstSellPrice < ActiveRecord::Migration[5.0]
  def change
    change_column :stocks, :est_sell_price, :float
  end
end
