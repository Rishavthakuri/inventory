class Unit < ApplicationRecord

  validates :name, presence:true
  validates :print_name, presence:true
  has_many :items
end
