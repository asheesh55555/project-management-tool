# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#admin
User.all.delete_all
admin = User.create!(email: "admin@gmail.com", 
	password: "password", 
	password_confirmation: "password")
admin.add_role :admin

#newuser
['it@gamil.com', 'web@gmail.com', 'user@gmail.com'].each do |email|
  user = User.create!(email: email, password: "password", password_confirmation: "password")
  user.add_role :newuser
end

['IT', 'Web'].each do |tech|
  Technology.create!(name: tech)
end

['Rakesh', 'Jack'].each do |client|
  Client.create!(name: client)
end

['Designer Team', 'Development Team'].each do |team|
	Team.create!(name: team)
end



