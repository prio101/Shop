class Authentication::SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      make_session_and_redirect('User Successfully Logged in')
    else
      error_and_redirect('Username or Password has mismatched or Incorrect')
    end
  end

  def signup
  end

  def register_user
    if params[:password].eql?(params[:password_confirmation])
      @user = User.new
      @user.username = params[:username]
      @user.password = params[:password]
      if @user.save!
        make_session_and_redirect('User Successfully Registerd')  
      else
        error_and_redirect('Input is missing')
      end
    else
      error_and_redirect('Password did not match')
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Successfully Logged Out'
    redirect_to root_path
  end

  private

  def make_session_and_redirect(str)
    session[:user_id] = @user.id
    flash[:success] = str
    redirect_to root_path
  end

  def error_and_redirect(str)
    flash[:error] = str
    redirect_to :back
  end
end
