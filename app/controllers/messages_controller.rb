class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.request = request
    if @message.deliver
      flash.now[:notice] = 'Encrypting successfull. We will sell your data!'
    else
      flash.now[:error] = 'Cannot encrypt message.'
      render :new
    end
  end
end