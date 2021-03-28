class PricesController < ApplicationController
  before_action :check_permissions
  before_action :price_object, only: [ :new, :create ]
  before_action :set_price, except: [ :index, :new, :create, :show ]


  def index
    @prices = Price.all
  end

  def new
  end

  def create
    @price.price = price_params[:price]
    @price.product_id = price_params[:product_id]
    
    if @price.save  
      flash[:success] = 'Successfully Created'
      redirect_to prices_path
    else
      flash[:error] = 'Can not create'
      redirect_to prices_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    if @price.destroy
      redirect_to prices_path
    end
  end

  private

  def set_price
    @price = Price.find(params[:id])
  end

  def check_permissions   
    redirect_to root_path unless logged_in? and action_permissions_list(controller_name).include?(action_name)
  end

  def price_object
    @price = Price.new
  end

  def price_params
    params.require(:price).permit(:price, :product_id)
  end
end
