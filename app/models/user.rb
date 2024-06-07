class User < ApplicationRecord
  validates :name, presence: :true
  validates :email, presence: :true
  has_many :expenses, foreign_key: :user_id
  has_many :sales, foreign_key: :user_id
end
