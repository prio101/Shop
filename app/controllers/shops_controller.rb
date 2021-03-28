class ShopsController < ApplicationController
  def index
    @products = Product.where(published: true)
  end
end
