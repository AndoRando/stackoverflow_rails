class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:danger] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user] ||= @user.as_json
    if params[:is_admin?]
      params[:user][:is_admin?] = true
    end
    if @user.update(user_params)
      flash[:success] = "#{@user.name} is now an admin."
      redirect_to user_path(@user)
    else
      flash[:danger] = "Something happened, dawg."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin?, :id, :password_salt, :password_hash, :created_at, :updated_at)
  end
end
