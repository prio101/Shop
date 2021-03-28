class CartItem < ApplicationRecord
  belongs_to  :product
  belongs_to  :cart  
  belongs_to :order, optional: true

  def price
    Price.find(self.price_id).price
  end
end
