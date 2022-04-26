class Order < ApplicationRecord
  belongs_to :orderstatus
  belongs_to :cart

  has_one :cart, dependent: :delete
  has_one :orderstatus, dependent: :delete
end
