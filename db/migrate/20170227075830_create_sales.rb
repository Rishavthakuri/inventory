class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.string :unit_sell_price
      t.integer :quantity
      t.string :cash_credit
      t.integer :customer_id

      t.timestamps
    end
  end
end
