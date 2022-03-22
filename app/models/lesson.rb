class Lesson < ApplicationRecord
  belongs_to :instrument

  # Validation
  validates :price, presence: true
end
