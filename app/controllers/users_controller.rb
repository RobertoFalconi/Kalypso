class UsersController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => :create
	
  before_action :logged_in_user, only: [ :edit, :update, :show, :destroy]
  before_action :admin_user, only: [ :index]
  before_action :correct_user, only: [ :edit, :update, :show]

	
  def show
	if current_user.admin? && current_user!= @user
		redirect_to edit_user_path
	else
      @user = User.find(params[:id])
	end
  end

  def ban
    @user = User.find(params[:id])
    @user.update_attributes(banned: true)
	flash[:success] = "Profile updated"
	redirect_to users_path
  end

  def unban
    User.find(params[:id]).update_attributes(banned: 'f')
    flash[:success] = "Profile updated"
	redirect_to users_path
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
	q = params[:user][:question]
	if @user.save
      @user.update_attributes(question: q)
	  @user.update_attributes(answer: encrypt(params[:user][:answer], 'kalypso'))
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
      if current_user.admin? #&& current_user != @user
	    params[:user][:banned] == '1' ? ban : unban
	  else redirect_to @user
	  end
	  #redirect_to @users
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
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end

  private

    def user_params
      params.require(:user).permit( :name, :email, :password, :password_confirmation, :banned, :question, :answer)
    end

    def admin_user
      redirect_to(current_user) unless current_user.nil? || current_user.admin?
    end
	
	def encrypt(message, key)
		cipher = Gibberish::AES.new(key)
		if message == ''
			return
		end
		result = cipher.encrypt(message)
		return result
	end

	
		
	
end


