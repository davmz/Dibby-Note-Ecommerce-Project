class InstrumentType < ApplicationRecord
  has_many :instruments

  validates :name, presence: true
  validates :name, uniqueness: true
end
