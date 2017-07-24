require 'rails_helper'
require 'pp'

RSpec.describe Message, :type => :model do
   subject { described_class.new(
       key: "chiave",
       messaggio: "prova testo",
       timeout: "08-25-2018"
       )}
    
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "abcdef"
        expect(subject).to_not be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "99/99/99"
        expect(subject).to_not be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "08/25.2018"
        expect(subject).to_not be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "99_99_99"
        expect(subject).to_not be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "07.01.17"
        expect(subject).to_not be_valid
    end
    
    it "is not valid with invalid timeout" do
        subject.timeout = "07-25-1017"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a key" do
        subject.key = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a messaggio" do
        subject.messaggio = nil
        expect(subject).to_not be_valid
    end
    
    it "i can see the message if timeout and key are valid" do
        expect(decrypt(encrypt(subject),subject.key)).to eq subject.messaggio
    end
    
    it "i can not see the message if the timeout is no longer valid" do
        subject.timeout = "07-25-2012"
        expect(decrypt(encrypt(subject),subject.key)).to eq 'Time-out expired'
    end
    
    it "i can not see the message if the key is not valid" do
        expect{mes = decrypt(encrypt(subject),'chiave sbagliata')}.to raise_error(Gibberish::AES::SJCL::DecryptionError)
    end
    
    it "i can not see the message if the message is not valid" do
        subject.messaggio = nil
        expect{mes = decrypt(encrypt(subject),'chiave sbagliata')}.to raise_error(NoMethodError)
    end
    
    it "i can not see the message if the key is not present" do
        subject.key = nil
        expect{mes = decrypt(encrypt(subject),'chiave sbagliata')}.to raise_error(TypeError)
    end
        
    def encrypt(mess)
        cipher = Gibberish::AES.new(mess.key)
		if mess.timeout == ''
            result = cipher.encrypt(mess.messaggio+'@'+'9999/9999/99999')
        else
            result = cipher.encrypt(mess.messaggio+'@'+mess.timeout)
        end
        return result
	end

	def decrypt (message, key) 
        cipher = Gibberish::AES.new(key)
        result = cipher.decrypt(message)
        time = result.split('@')[1]
        if time.include?('/')  
            time = time.split('/')
        elsif time.include?('-') 
            time = time.split('-')
        else 
            time = time.split('.')
        end
        now = get_time()
        res = result.split('@')[0]
        
        if (now[0].to_i > time[2].to_i) 
            res = 'Time-out expired'  
        end
        
        if (now[0].to_i <= time[2].to_i and now[1].to_i > time[0].to_i)
            res = 'Time-out expired' 
        end
        
        if (now[0].to_i <= time[2].to_i and now[1].to_i <= time[0].to_i and now[2].to_i > time[1].to_i)
            res = 'Time-out expired'  
        end

        return res
		
	end
    
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
    
end