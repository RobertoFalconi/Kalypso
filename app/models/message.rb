class Message < MailForm::Base
    
    #VALID_TIMEOUT_REGEX = /(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:0?[1,4-9]|1[0-9]|2[0-9]|3[0-1])(\/|-|\.)(1[8-9]|2[0-9])[0-9][0-9]/i


    VALID_TIMEOUT_REGEX = /(?:0?[1,3-9]|1[0-2])((\/)(?:0?[1,4-9]|1[0-9]|2[0-9]|3[0-1])(\/)(1[8-9]|2[0-9])[0-9][0-9])|((?:0?[1,3-9]|1[0-2])(-)(?:0?[1,4-9]|1[0-9]|2[0-9]|3[0-1])(-)(1[8-9]|2[0-9])[0-9][0-9])|((?:0?[1,3-9]|1[0-2])(\.)(?:0?[1,4-9]|1[0-9]|2[0-9]|3[0-1])(\.)(1[8-9]|2[0-9])[0-9][0-9])/i



    attribute :key
    attribute :messaggio
    attribute :timeout
    validates :key, presence: true
    validates :messaggio, presence: true
    validates :timeout, format: {with: VALID_TIMEOUT_REGEX}
	
end