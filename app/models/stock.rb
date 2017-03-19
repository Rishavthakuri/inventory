class Stock < ApplicationRecord

  # validates :item_id, presence:true
  # validates :quantity, presence:true
  # validates :unit_price, presence:true
  # validates :est_sell_price, presence:true
  belongs_to :item, required: false
end
