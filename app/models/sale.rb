class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :sale_items, foreign_key: :sale_id
end
