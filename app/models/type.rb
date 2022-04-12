class Type < ApplicationRecord
  has_many :instrument, dependent: :destroy

  # Validation
  validates :name, presence: true, uniqueness: true
end
