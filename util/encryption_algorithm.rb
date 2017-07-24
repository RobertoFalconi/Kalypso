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

def encrypt(message, key, timeout)
	cipher = Gibberish::AES.new(key)
	result = cipher.encrypt(message+'@'+timeout)
	return result
end

def encrypt2(message, key)
	cipher = Gibberish::AES.new(key)
	result = cipher.encrypt(message)
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
	if (now[0] > time[2]) then return 'Time-out expired' end
	if (now[0] <= time[2] and now[1] > time[0]) then return 'Time-out expired' end
	if (now[0] <= time[2] and now[1] <= time[0] and now[2] > time[1]) then return 'Time-out expired' end
	return result.split('@')[0]
end
		
def decrypt2 (message, key)
	cipher = Gibberish::AES.new(key)
	result = cipher.decrypt(message)
	return result
end

def download (message, key)
	text = encrypt(message, key)
	File.write('prova.txt',text)
	return text
end

def upload (filepath, key)
	file = File.open(filepath, 'r')
	contents = file.read
	text = decrypt(contents, key)
	return text
end

## TEST ##

#puts encrypt('zieta', 'kalypso', '2018/07/02')

#encrypt2('gino', 'kalypso')

#puts decrypt('{"v":1,"adata":"","ks":256,"ct":"Fp1X2AlrryE/55f822pd3GUX2CsBAhaaDiiyKA==","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"6HxkBl1MsVKOTFtk","salt":"dTit4kR7rls="}', 'wrong key')
		
print get_time()
		
#puts decrypt2('{"v":1,"adata":"","ks":256,"ct":"C/4qTA9vGfl+dLmcpw==","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"Qo3xdjxdpMOL64g0","salt":"0pOXoAL9k00="}', '')

#puts download('tvb','infinito')

#puts upload('prova.txt','infinito')

#print get_time()