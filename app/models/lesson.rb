class Lesson < ApplicationRecord
  belongs_to :instrument

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true
end
