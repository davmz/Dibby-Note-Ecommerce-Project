class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :nullify

  # Validation
  validates :status, presence: true
end
