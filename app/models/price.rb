class Price < ApplicationRecord
  belongs_to :product
  has_many  :cart_item
end
