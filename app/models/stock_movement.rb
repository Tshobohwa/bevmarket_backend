class StockMovement < ApplicationRecord
  validates :quantity, presence: true
  validates :movement_type, presence: true
  validates :unit_price, presence: true

  belongs_to :stock_item, foreign_key: :stock_item_id
  belongs_to :establishment, foreign_key: :establishment_id
end
