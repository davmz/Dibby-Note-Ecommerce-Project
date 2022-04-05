class Province < ApplicationRecord
  has_one :tax
  has_many :user

  # Validation
  validates :name, :code, presence: true, uniqueness: true
end