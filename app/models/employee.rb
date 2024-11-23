class Employee < ApplicationRecord
  validates :role, presence: :true
  belongs_to :establishment, foreign_key: :establishment_id
  belongs_to :user, foreign_key: :user_id
  belongs_to :sale_point, foreign_key: :sale_point_id
end
