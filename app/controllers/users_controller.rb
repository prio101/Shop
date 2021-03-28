class UsersController < ApplicationController
  before_action :set_user
  before_action :check_permissions

  def show
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def check_permissions
    redirect_to root_path unless logged_in? and action_permissions_list(controller_name).include?(action_name)
  end
end
