def edit() 
	a = '{"v":1,"adata":"","ks":256,"ct":"+60PdmJ3PS3JAS09tD/XGuDBhQWZRMD66HYygTEX0Zk=","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"l6aOyckXndj2SK83","salt":"H1rxbXKzgGY="}'
	b = '{\"v\":1,\"adata\":\"\",\"ks\":256,\"ct\":\" 60PdmJ3PS3JAS09tD\/XGuDBhQWZRMD66HYygTEX0Zk=\",\"ts\":96,\"mode\":\"gcm\",\"cipher\":\"aes\",\"iter\":100000,\"iv\":\"l6aOyckXndj2SK83\",\"salt\":\"H1rxbXKzgGY=\"}'

	c = b.gsub!("\\","").gsub!(' ','+')

	print a
	puts
	print c
	puts
	puts
	puts
	
	d = '{"v":1,"adata":"","ks":256,"ct":"9Jf++pKztykJGFVg/uN+oe9/CoYVqp5K887STmLkYgUE","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"8JeqKfT4IhBkkSKt","salt":"WhfSuKHKZc4="}'

	e = '{\"v\":1,\"adata\":\"\",\"ks\":256,\"ct\":\"9Jf  pKztykJGFVg\/uN oe9\/CoYVqp5K887STmLkYgUE\",\"ts\":96,\"mode\":\"gcm\",\"cipher\":\"aes\",\"iter\":100000,\"iv\":\"8JeqKfT4IhBkkSKt\",\"salt\":\"WhfSuKHKZc4=\"}'
	
	f = e.gsub!("\\","").gsub!(' ','+')
	
	print d
	puts
	print f
	puts
	puts
	puts
	
	
	g = '{"v":1,"adata":"","ks":256,"ct":"Roijg9ukqiVj0+o6JS7vQa93ecaM0bsGnoFJVgDD6Nqv0Q==","ts":96,"mode":"gcm","cipher":"aes","iter":100000,"iv":"LTOETbzphirBveee","salt":"Nhg0zrcmN9A="}'
	
	h = '{\"v\":1,\"adata\":\"\",\"ks\":256,\"ct\":\"Roijg9ukqiVj0 o6JS7vQa93ecaM0bsGnoFJVgDD6Nqv0Q==\",\"ts\":96,\"mode\":\"gcm\",\"cipher\":\"aes\",\"iter\":100000,\"iv\":\"LTOETbzphirBveee\",\"salt\":\"Nhg0zrcmN9A=\"}'
	
	i = h.gsub!("\\","").gsub!(' ','+')
	
	print g
	puts
	print i
	
	
end
	
puts edit()