class SaleItem < ApplicationRecord
  validates :quantity, presence: true
  validates :unit_sale_price, presence: true,  numericality: { greater_than: 0 }
  belongs_to :sale, foreign_key: :sale_id
end
