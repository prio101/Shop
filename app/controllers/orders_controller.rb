class OrdersController < ApplicationController
  
  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def new
    session[:order_params] ||= {}
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]    
  end
  
  def create
    merge_params
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]
      if params[:back_button]
        @order.previous_step
      elsif @order.last_step?
        @order.user_id = current_user.id
        if @order.all_valid? and @order.save
          update_cart_items
        end
      else
        @order.next_step
      end
      session[:order_step] = @order.current_step
    if @order.new_record?
      render "new"
    else
      session[:order_step] = session[:order_params] = nil
      flash[:notice] = "Order saved!"
      redirect_to root_path
    end
  end

  private
  
  def merge_params
    if params[:order]
      session[:order_params].deep_merge!(order_params)
    end
  end

  def update_cart_items
    @current_cart.cart_items.map { |item| item.update(order_id: @order.id) }
    session[:cart_id] = nil
  end

  def order_params
    params.require(:order).permit(:name, :street, :zip_code, :country, :email, :account_number, :bank_issue_number)
  end
  
end
