class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :orderstatus

  has_one :cart, dependent: :delete
  has_one :user, dependent: :delete
  has_one :orderstatus, dependent: :delete
end
