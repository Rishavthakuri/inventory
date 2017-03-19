class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :unit_cost_price
      t.integer :quantity
      t.integer :cash_credit
      t.integer :supplier_id

      t.timestamps
    end
  end
end
