require 'gibberish'

def encrypt(message, key)
	cipher = Gibberish::AES.new(key)
	return cipher.encrypt(message)
end


def decrypt (message, key)
	cipher = Gibberish::AES.new(key)
	return cipher.decrypt(message)
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

#puts encrypt('tvb', 'infinito')

#puts decrypt('{"v":1,"adata":"","ks":256,"ct":"T3CdXj08L1t3XhlKgTgu","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"eOXPXnAdFJFySUE+","salt":"EtFELcxFRc4="}', 'infinito')

#puts download('tvb','infinito')

#puts upload('prova.txt','infinito')