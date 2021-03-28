class Product < ApplicationRecord
  has_many :prices

  def latest_price
    self.prices.order(:created_at).first.price
  end

  def latest_price_id
    self.prices.order(:created_at).first.id
  end
end
