class InstrumentItem < ApplicationRecord
  belongs_to :instrument

  before_save :set_unit_price
  before_save :set_total_price

  has_one :instrument, dependent: :delete

  # Validation
  validates :unitprice, :quantity, :totalprice, presence: true
  validates :quantity, numericality: { only_integer: true }

  def unit_price
    if persisted?
      self[:unitprice]
    else
      instrument.price
    end
  end

  def total_price
    unitprice * quantity
  end

  private

  def set_unit_price
    self[:unitprice] = unitprice
  end

  def set_total_price
    self[:totalprice] = quantity * set_unit_price
  end
end
