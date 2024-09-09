class Establishment < ApplicationRecord
  validates :name, presence: true
  has_many :employees, foreign_key: :establishement_id, dependent: :destroy
  has_many :sale_points, foreign_key: :establishement_id, dependent: :destroy
end
