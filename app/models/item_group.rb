class ItemGroup < ApplicationRecord

  validates :name, presence:true
  validates :description, presence:true
  has_many :item_groups ,class_name: "Item" , foreign_key: "item_group_id"
end
