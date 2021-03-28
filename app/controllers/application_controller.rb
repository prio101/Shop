class ApplicationController < ActionController::Base
  include RbacHelper
  
  before_action :current_cart

  helper_method :logged_in?, :current_user

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  
  private
    def current_cart
      unless session[:cart_id].nil?
        @current_cart = Cart.find(session[:cart_id])
      else
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
end
