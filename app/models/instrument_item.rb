class InstrumentItem < ApplicationRecord
  belongs_to :instrument

  has_one :instrument, dependent: :delete

  # Validation
  validates :unitprice, :quantity, :totalprice, presence: true
  validates :quantity, numericality: { only_integer: true }
end
