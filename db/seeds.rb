# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


def encrypt(message, key)
    cipher = Gibberish::AES.new(key)
	result = cipher.encrypt(message)
	return result
end

Site.create!(id: "1", suspended: "false")
User.create!(name:  "Admin",
             email: "admin@kalypso.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true,
			 activated: true,
             activated_at: Time.zone.now,
	         question: 1,
	         answer: encrypt('pooh','kalypso'))

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@kalypso.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
	  		   activated: true,
               activated_at: Time.zone.now,
	           question: 1,
	           answer: encrypt('pooh','kalypso'))

end
