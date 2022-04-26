class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :instrument_cart
end
