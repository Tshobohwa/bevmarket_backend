class StockItem < ApplicationRecord
  validates :quantity, presence: true
  validates :unit_sale_price, presence: true
  validates :last_unit_buy_price, presence: true
  validates :reduction_sale_price, presence: true
  validates :average_unit_buy_price, presence: true
  belongs_to :item, foreign_key: :item_id
  has_many :sale_items, foreign_key: :stock_item_id
end
