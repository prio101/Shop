class AddOptionalReferenceOrderToCartItemsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference  :cart_items, :order
  end
end
