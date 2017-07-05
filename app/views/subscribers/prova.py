s = '["gino@gmail.com" "pino@outlook.com"]'

s = s.strip('[').strip(']')

s = s.replace('"', '')

s = s.replace(' ',', ')

return s