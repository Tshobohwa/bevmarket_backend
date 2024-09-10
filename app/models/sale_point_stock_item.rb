class SalePointStockItem < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :stock_item, foreign_key: :stock_item_id
  belongs_to :sale_point, foreign_key: :sale_point_id
end
