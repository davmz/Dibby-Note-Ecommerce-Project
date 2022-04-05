class Instrument < ApplicationRecord
  # paginates_per 10

  belongs_to :type
  has_one :lesson

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true

  # Active Storage
  has_one_attached :image
end
