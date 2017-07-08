class KalypsoController < ApplicationController

  def home
    return redirect_to(current_user) if current_user.present? && !current_user.admin?
  end

  def about
  end

  def faq
  end
    
  def specialoptions
  end

  def suspended
    if current_user.admin? 
      redirect_to suspended_path unless request.fullpath == '/suspended'
    elsif Site.find(1).suspended? && !current_user.admin?
      redirect_to suspended_path unless request.fullpath == '/suspended'
    else redirect_to root_path
    end
  end

  def suspend
    if current_user.admin? 
      Site.find(1).update_attributes(suspended: true)
      redirect_to user_path
    end
  end
    
  def unsuspend
    if current_user.admin? 
      Site.find(1).update_attributes(suspended: false)
      redirect_to user_path
    end
  end
    
  def update
    params[:site][:suspended] == '1' ? suspend : unsuspend
  end

end