class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :instrument_item

  has_one :user, dependent: :delete
  has_many :instrumentcart, dependent:
                                      :destroy

  # Validation
  validates :totalprice, :taxprice, presence: true, numericality: { only_integer: true }
end
