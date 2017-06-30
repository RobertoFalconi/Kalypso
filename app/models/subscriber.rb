class Subscriber < ApplicationRecord
	validates :names, :email, presence: true
end
