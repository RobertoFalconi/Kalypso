class SessionsController < ApplicationController

  def new
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

end
