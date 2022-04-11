class OrderStatus < ApplicationRecord
  # Validation
  validates :status, presence: true
end
