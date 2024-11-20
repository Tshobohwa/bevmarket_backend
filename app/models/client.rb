class Client < ApplicationRecord
  validates :name, presence: :true
  validates :phone_number, presence: true
  has_many :sales
  belongs_to :establishment, foreign_key: :establishment_id, dependent: :destroy
end
