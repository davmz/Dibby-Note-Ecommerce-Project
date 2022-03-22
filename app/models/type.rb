class Type < ApplicationRecord
  has_many :instrument_types
  has_many :instruments, through: :instrument_types

  # Validation
  validates :name, presence: true, uniqueness: true
end
