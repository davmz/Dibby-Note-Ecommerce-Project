class Instrument < ApplicationRecord
  belongs_to :instrumenttype

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
end
