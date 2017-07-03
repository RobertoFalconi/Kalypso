class ApplicationController < ActionController::Base

  before_action :banned?

  protect_from_forgery with: :exception
  include SessionsHelper

  def banned?
    if current_user.present? && current_user.banned?
      log_out
      flash[:error] = "This account has been suspended."
      redirect_to root_path
    end
  end
  
end
