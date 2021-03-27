class ProductsController < ApplicationController
  before_action :check_permissions, only: [ :new, :create, :show, :edit, :destroy ]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def check_permissions
    redirect_to root_path unless logged_in? and action_permissions_list(controller_name).split(',').include?(action_name)
  end
end
