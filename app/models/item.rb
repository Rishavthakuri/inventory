class Item < ApplicationRecord

  validates :name, presence:true
  validates :unit_id, presence:true
  validates :item_code, presence:true
  validates :item_group_id, presence:true
  validates :description, presence:true
  validates :item_group, presence:true
  belongs_to :unit

  belongs_to :item_group

  has_many :sales

  has_one :stock, :dependent => :destroy

  accepts_nested_attributes_for :stock


end
