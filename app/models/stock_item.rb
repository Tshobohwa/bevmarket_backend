class StockItem < ApplicationRecord
  vaildates :quantity, presence: true
  validates :unit_sale_price, presence: true
  validates :last_unit_buy_price, presence: true
  validates :reduction_sale_price, presence: true
  validates :average_unit_buy_price, presence: true
end
