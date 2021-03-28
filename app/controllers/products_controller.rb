class ProductsController < ApplicationController
  before_action :check_permissions
  before_action :set_product, except: [ :index, :new, :create ]
  before_action :product_object, only: [ :new, :create ]
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product.title = product_params[:title]
    @product.description = product_params[:description]
    if @product.valid? and @product.save
      byebug
      flash[:success] = 'Sucessfully Created'
      redirect_to products_path
    else
      flash[:error] = 'Can Not Be Created'
      redirect_to root_path
    end
    
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def check_permissions
    redirect_to root_path unless logged_in? and action_permissions_list(controller_name).include?(action_name)
  end

  def product_object
    @product = Product.new
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
