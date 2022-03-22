class Province < ApplicationRecord
  # Validation
  validates :name, presence:true
end
