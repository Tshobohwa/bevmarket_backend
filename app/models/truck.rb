class Truck < ApplicationRecord
  validates :matricule, presence: false
  validates :marque, presence: true
  belongs_to :sale_point, foreign_key: :sale_point_id
end
