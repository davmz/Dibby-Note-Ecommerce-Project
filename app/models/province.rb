class Province < ApplicationRecord
  # Validation
  validates :name, :code, presence: true, uniqueness: true
end
