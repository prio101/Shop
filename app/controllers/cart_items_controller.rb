class CartItemsController < ApplicationController
  before_action :set_cart_items, only: [ :destroy, :add_quantity, :reduce_quantity ]

  def create
    product = Product.find(params[:product_id])
    if current_cart.products.include?(product)
      @cart_item = @current_cart.cart_items.find_by(product_id: product.id)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      assign_values @cart_item, product
    end
    byebug
    if @cart_item.valid? and @cart_item.save
      flash[:success] = 'Successfully Added the Product to the Cart'
      redirect_to root_path
    end
  end

  def add_quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    if @cart_item.destroy
      flash['success'] = 'Successfully removed the Item form cart'
      redirect_to cart_path(@current_cart)
    end
  end

  private

  def set_cart_items
    @cart_item = CartItem.find(params[:id])
  end

  def assign_values cart_item, product
    cart_item.cart = current_cart
    cart_item.product = product
    cart_item.price_id = product.latest_price_id
    cart_item.quantity += 1
    cart_item
  end

  def cart_item_params
    params.require(:cart_items).permit(:quantity, :product_id, :cart_id)
  end
end
