class SalePoint < ApplicationRecord
  validates :name, presence: true
  belongs_to :establishement, foreign_key: :establishement_id
  validates :type, presence: true
  validates :address, presence: true
  has_many :sale_point_stock_items, foreign_key: :sale_point_id
end
