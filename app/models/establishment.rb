class Establishment < ApplicationRecord
  validates :name, presence: true
  has_many :employees, foreign_key: :establishment_id, dependent: :destroy
  has_many :sale_points, foreign_key: :establishment_id, dependent: :destroy
  belongs_to :user, foreign_key: :created_by
  has_many :items, foreign_key: :establishment_id, dependent: :destroy
end
