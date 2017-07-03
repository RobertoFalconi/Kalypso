class SessionsController < ApplicationController

  def new
    return redirect_to(current_user) if current_user.present?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log the user in and redirect to the user's show page
      log_in user
      remember user
      redirect_back_or user # -> user_url(user)
    else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

	protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned?
      sign_out resource
      flash[:error] = "This account has been suspended for violation of...."
      root_path
    else
      super
    end
   end
	
end
