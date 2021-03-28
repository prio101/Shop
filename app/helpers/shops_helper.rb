module ShopsHelper
  def cart_item_count
    @current_cart.cart_items.count
  end
end
