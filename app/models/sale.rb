class Sale < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :client, foreign_key: :client_id
  has_many :sale_items, foreign_key: :sale_id
end
