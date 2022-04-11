class OrderStatus < ApplicationRecord
  has_many :orders

  # Validation
  validates :status, presence: true
end
