class Expense < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates :amount, presence: true
  validates :reason, presence: true
  belongs_to :sale_point, foreign_key: :sale_point_id
  belongs_to :establishment, foreign_key: :establishment_id
end
