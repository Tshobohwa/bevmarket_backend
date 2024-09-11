class SalePoint < ApplicationRecord
  validates :name, presence: true
  belongs_to :establishment, foreign_key: :establishment_id
  validates :address, presence: true
  validates :sale_point_type, presence: true
  has_many :sale_point_stock_items, foreign_key: :sale_point_id
end
