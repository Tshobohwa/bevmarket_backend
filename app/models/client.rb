class Client < ApplicationRecord
  validates :name, presence: :true
  validates :phone_number, presence: true
  has_many :sales, foreign_key: :client_id
end
