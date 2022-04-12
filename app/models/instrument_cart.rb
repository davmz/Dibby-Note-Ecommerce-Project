class InstrumentCart < ApplicationRecord
  belongs_to :instrument

  has_one :instrument, dependent: :delete

  # Validation
  validates :price, presence: true
  validates :quantity, numericality: { only_integer: true }
end
