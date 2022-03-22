class Province < ApplicationRecord
  has_one :tax

  # Validation
  validates :name, :code, presence: true, uniqueness: true
end