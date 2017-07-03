class KalypsoController < ApplicationController

  def home
    return redirect_to(current_user) if current_user.present?
  end

  def about
  end

  def faq
  end

  def contact
  end

end
