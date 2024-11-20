class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  validates :name, presence: :true
  validates :email, presence: :true
  has_many :expenses, foreign_key: :user_id
  has_many :sales, foreign_key: :user_id
  has_one :employee, foreign_key: :user_id
  has_one :establishment, foreign_key: :created_by
end
