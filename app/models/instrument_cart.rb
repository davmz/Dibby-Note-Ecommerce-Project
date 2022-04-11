class InstrumentCart < ApplicationRecord
  belongs_to :instrument
  has_one :instrument

  # Validation
  validates :price, presence: true
  validates :quantity, numericality: { only_integer: true }
end
