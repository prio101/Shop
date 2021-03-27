class Authentication::SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Logged In'
      redirect_to root_path
    else
      flash[:error] = 'Username or Password has mismatched or Incorrect'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Successfully Logged Out'
    redirect_to root_path
  end
end
