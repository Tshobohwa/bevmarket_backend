class Expense < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates :amount, presence: true
  validates :reason, presence: true
end
