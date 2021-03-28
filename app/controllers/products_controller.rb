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
      flash[:success] = 'Sucessfully Created'
      redirect_to new_price_path 
    else
      flash[:error] = 'Can Not Be Created'
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = 'Updated Product'
      redirect_to root_path
    end
  end

  def destroy
    if @product.update(published: false)
      redirect_to products_path
    end
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
    params.require(:product).permit(:title, :description, :price)
  end
end
