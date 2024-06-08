class Item < ApplicationRecord
  validates :name, presence: :true
  validates :bottles_number, presence: :true
  validates :capacity, presence: :true
  # validates :capacity_unit, default: 'cl'
  # enums capacity_unit: [:dl, :ml, :cl]
  has_many :stock_item, foreign_key: :item_id
end
