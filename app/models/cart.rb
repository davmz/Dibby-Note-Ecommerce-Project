class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :instrument_item

  before_save :set_subtotal

  has_one :user, dependent: :delete
  has_many :instrument_item, dependent:
                                        :destroy

  # Validation
  validates :subtotal, :total, :tax, presence: true

  def subtotal
    instrument_items.collect do |instrument_item|
      instrument_item.valid? ? (instrument_item.unitprice * instrument_item.quantity) : 0
    end.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
