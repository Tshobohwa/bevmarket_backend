class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :sale_point, foreign_key: :sale_point_id
  has_many :sale_items, foreign_key: :sale_id
  belongs_to :establishment, foreign_key: :establishment_id
end
