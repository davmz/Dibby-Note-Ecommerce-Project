class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :instrument_cart

  has_one :user, dependent: :delete
  has_many :instrumentcart, dependent:
                                      :destroy

  # Validation
  validates :subtotal, :total, :tax, presence: true
end
