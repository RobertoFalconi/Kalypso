class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

 # def create
  #  @message = Message.new(message_params)
  #end
	
  def create
	mess = Message.new(message_params)
	#@message.update_attributes(messaggio: encrypt2('stocazzo','ciao'))
	@message = Message.new(:key => mess.key, :messaggio=> encrypt2(mess.messaggio, mess.key, mess.timeout), :timeout=> mess.timeout)
	#flash[:success] = @message.messaggio
  end
	
	def message_params
      params.require(:message).permit( :key, :messaggio, :timeout)
    end
	
	def encrypt2(message, key, timeout)
		cipher = Gibberish::AES.new(key)
		result = cipher.encrypt(message+'@'+timeout)
		return result
	end

	def decrypt2 (message, key)
		cipher = Gibberish::AES.new(key)
		result = cipher.decrypt(message)
		time = result.split('@')[1]
		time = time.split('/')
		now = get_time()
		if (now[0] > time[0]) then return 'Time-out expired' end
		if (now[0] == time[0] and now[1] > time[1]) then return 'Time-out expired' end
		if (now[0] == time[0] and now[1] == time[1] and now[2] > time[2]) then return 'Time-out expired' end
		return result.split('@')[0]
	end
			
end