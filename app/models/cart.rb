class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :instrumentcart
  belongs_to :lesson

  has_one :user
  has_many :lesson
  has_many :instrumentcart

  # Validation
  validates :totalprice, :taxprice, presence: true, numericality: { only_integer: true }
end
