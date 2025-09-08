class SalePoint < ApplicationRecord
  validates :sale_point_type, presence: false
  belongs_to :establishment, foreign_key: :establishment_id
  has_many :sale_point_stock_items, foreign_key: :sale_point_id
  has_one :truck, foreign_key: :sale_point_id, dependent: :destroy
  has_one :warehouse, foreign_key: :sale_point_id, dependent: :destroy
  has_many :sales, foreign_key: :sale_point_id
  has_many :expenses, foreign_key: :sale_point_id
end
