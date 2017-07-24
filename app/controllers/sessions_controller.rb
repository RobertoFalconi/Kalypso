class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
  def new
    return redirect_to(current_user) if current_user.present?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_back_or user # -> user_url(user)
    else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
    end
  end
	
  
def restored
	user = User.find_by(email: params[:session][:email].downcase)
	if user && (params[:session][:answer] == decrypt(user.answer,'kalypso'))
	  log_in user
	  remember user
	  redirect_to edit_user_path(user)
	  flash[:danger] = "Restore your password now!"
	else
      redirect_to restore_path
      flash[:error] = 'Invalid email/question/answer combination'
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
	
  def decrypt (message, key)
      cipher = Gibberish::AES.new(key)
      result = cipher.decrypt(message)
      return result
    end
	
end
