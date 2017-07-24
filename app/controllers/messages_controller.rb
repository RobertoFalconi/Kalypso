class MessagesController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => :create
	
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
        mess = Message.new(message_params)
	   if params[:commit] == 'Encrypt message'
		  mess = Message.new(message_params)
		  @message = Message.new(:key => mess.key, :messaggio=> encrypt(mess.messaggio, mess.key, mess.timeout), :timeout=> mess.timeout)
	   elsif params[:commit] == 'Decrypt message'
		  mess = Message.new(message_params)
		  @message = Message.new(:key => mess.key, :messaggio=> decrypt(mess.messaggio, mess.key), :timeout=> mess.timeout)
	   elsif params[:commit] == "Download qrcode"
		  send_file 'https://api.qrserver.com/v1/create-qr-code/?data='+@message.messaggio+'&amp;size=300x300', type: 'image/png', disposition: 'attachment'	
	   end
    end
	
	private
    
    def message_params
        params.require(:message).permit( :key, :messaggio, :timeout) 
    end
	
	def encrypt(message, key, timeout)
        if message == '' or key == '' or (message.length > 15 and current_user.nil?)
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
        
    def decrypt (message, key) 
        begin
			cipher = Gibberish::AES.new(key)
			result = cipher.decrypt(message)
			time = result.split('@')[1]
            
            if time.include?('.') 
               time = time.split('.')
            end
            if time.include?('/')  
                time = time.split('/')
            end
            if time.include?('-') 
               time = time.split('-')
            end
            
			
			now = get_time()
			if (now[0] > time[2]) then return 'Time-out expired' end
			if (now[0] <= time[2] and now[1] > time[0]) then return 'Time-out expired' end
			if (now[0] <= time[2] and now[1] <= time[0] and now[2] > time[1]) then return 'Time-out expired' end
			return result.split('@')[0]
			
			rescue
				redirect_to messages_path
				flash[:error]='invalid message or key'
		end
	end
			
end