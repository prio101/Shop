class ShopsController < ApplicationController
  def index
    @products = Product.all
  end
end
