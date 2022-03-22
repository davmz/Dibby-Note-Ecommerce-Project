class Type < ApplicationRecord
  has_many :instrument

  # Validation
  validates :name, presence: true, uniqueness: true
end
