class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:success] = "You've been logged in."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:danger] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out successfully."
    redirect_to "/"
  end
end
