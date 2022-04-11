class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :orderstatus

  has_one :cart
  has_one :user
  has_one :orderstatus
end
