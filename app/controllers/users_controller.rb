class UsersController < ApplicationController

  before_action :logged_in_user, only: [ :edit, :update, :show, :destroy]
  before_action :admin_user, only: [ :index]
  before_action :correct_user, only: [ :edit, :update, :show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    return redirect_to(current_user) if current_user.present?
  end

  def index
    if !logged_in?
      redirect_to signup_path
    else  @users = User.paginate(page: params[:page])
 
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    if current_user.nil?
      redirect_to root_path
    else redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Kalypso!"
      redirect_to @user
    else
      render 'new'
    end

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private

    def user_params
      params.require(:user).permit( :name, :email, :password, 
                                    :password_confirmation)
    end

    def admin_user
      redirect_to(current_user) unless current_user.nil? || current_user.admin?
    end

end
