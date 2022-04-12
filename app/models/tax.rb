class Tax < ApplicationRecord
  belongs_to :province

  # Validation
  validates :totaltax, presence: true
end
