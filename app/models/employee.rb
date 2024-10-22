class Employee < ApplicationRecord
  validates :role, presence: :true
  belongs_to :establishment, foreign_key: :establishment_id
  belongs_to :user, foreign_key: :user_id
end
