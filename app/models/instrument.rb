class Instrument < ApplicationRecord
  belongs_to :type
  has_one :lesson

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true
end
