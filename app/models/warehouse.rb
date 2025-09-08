class Warehouse < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  belongs_to :sale_point, foreign_key: :sale_point_id
end
