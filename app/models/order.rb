class Order < ApplicationRecord
  belongs_to :status
  belongs_to :cart

  has_one :cart, dependent: :delete
  has_one :orderstatus, dependent: :delete
end
