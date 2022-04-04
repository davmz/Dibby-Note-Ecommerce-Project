class Page < ApplicationRecord

  # Validation
  validates :title, :content, :permalink, presence: true
  validates :permalink, uniqueness: true
end
