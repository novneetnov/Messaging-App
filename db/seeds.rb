User.delete_all

User.create!(username: "test", 
						 email: "test@example.com", 
						 password: "password", 
						 password_confirmation: "password")

15.times do |n|
	user_name = Faker::Internet.user_name
	email = "username#{n}@example.com"
	password = "password"
	User.create!(username: user_name, email: email, password: password, password_confirmation: password)
end
