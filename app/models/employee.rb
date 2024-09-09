class Employee < ApplicationRecord
  validates :role, presence: :true
  belongs_to :establishement, foreign_key: :establishement_id
  belongs_to :user, foreign_key:
end
