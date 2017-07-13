class Message < MailForm::Base
  attribute :key
  attribute :messaggio
  attribute :timeout
  validates :key, presence: true
  validates :messaggio, presence: true
	
  
end