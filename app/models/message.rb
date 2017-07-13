class Message < MailForm::Base
  attribute :key
  attribute :messaggio
  attribute :timeout
  validates :key, presence: true, length: {minimum: 8}
  validates :messaggio, presence: true

end