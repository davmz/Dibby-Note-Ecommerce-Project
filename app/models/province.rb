class Province < ApplicationRecord
  has_one :tax, dependent: :nullify
  has_many :user, dependent: :destroy

  # Validation
  validates :name, :code, presence: true, uniqueness: true
end
