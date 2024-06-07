class Client < ApplicationRecord
  validates :name, presence: :true
  validates :phone_number, presence: true
  has_may :sales, foreign_key: :client_id
end
