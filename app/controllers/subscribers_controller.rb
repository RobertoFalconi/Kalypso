class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def index
    @subscriber = Subscriber.new
  end
	
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Saved!"
    else
      #redirect_to subscribers_path, notice: "Failed"
      flash.now[:error] = 'Failed'
      render :index
    end
	
  end
	
  private

  def subscriber_params
    params.require(:subscriber).permit( :name, :email)
  end

end
