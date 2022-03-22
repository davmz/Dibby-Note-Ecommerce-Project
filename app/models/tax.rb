class Tax < ApplicationRecord
  belongs_to :province

  # Validation
  validates :totaltax, presence: true
  validates :pst, :gst, :hst, :totaltax, numericality: true
end