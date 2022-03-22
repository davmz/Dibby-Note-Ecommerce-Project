class Instrument < ApplicationRecord
  has_one :lesson

  has_many :instrument_types
  has_many :types, through: :instrument_types

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true
end
