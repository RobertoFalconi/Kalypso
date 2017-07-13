class MessagesController < ApplicationController
	
  require 'gibberish'

	def get_time()
		now = Time.now           # Current time
		temp = now.to_s.split('-')
		temp2 = temp[2].split(' ')
		temp3 = temp2[1].split(':')

		temp.delete(temp[2])
		temp2 = temp2[0]

		time = temp.insert(2,temp2)
		time = time.insert(3,temp3[0])
		time = time.insert(4,temp3[1])
		time = time.insert(5,temp3[2])

		return time
	end
	
  def new
    @message = Message.new
  end

  def create
	if params[:commit] == 'Encrypt message'
		mess = Message.new(message_params)
		@message = Message.new(:key => mess.key, :messaggio=> encrypt2(mess.messaggio, mess.key, mess.timeout), :timeout=> mess.timeout)
	else
		mess = Message.new(message_params)
		@message = Message.new(:key => mess.key, :messaggio=> decrypt2(mess.messaggio, mess.key), :timeout=> mess.timeout)
	end
  end
	
	def message_params
      params.require(:message).permit( :key, :messaggio, :timeout)
    end
	
	def encrypt2(message, key, timeout)
		if message == '' or key == ''
			flash[:error] = 'invalid message or key'
			redirect_to messages_path
		else
			cipher = Gibberish::AES.new(key)
			if timeout == ''
				result = cipher.encrypt(message+'@'+'9999/9999/99999')
			else
				result = cipher.encrypt(message+'@'+timeout)
			end
			return result
		end
	end

	def decrypt2 (message, key)
		cipher = Gibberish::AES.new(key)
		result = cipher.decrypt(message)
		time = result.split('@')[1]
		time = time.split('/')
		now = get_time()
		if (now[0] > time[2]) then return 'Time-out expired' end
		if (now[0] <= time[2] and now[1] > time[0]) then return 'Time-out expired' end
		if (now[0] <= time[2] and now[1] <= time[0] and now[2] > time[1]) then return 'Time-out expired' end
		return result.split('@')[0]
end
			
end