class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :item_id
      t.integer :quantity
      t.float :unit_price
      t.float :est_sell_price

      t.timestamps
    end
  end
end
