# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

#create users
3.times do
 user = User.new(
   name:     Faker::Name.name,
   email:    Faker::Internet.email,
   password: 'helloworld'
 )
 user.skip_confirmation!
 user.save!
end

brock = User.new(
  name:     'brock',
  email: 'brockdonovan@gmail.com',
  password: 'helloworld'
)
brock.skip_confirmation!
brock.save!

users = User.all

# Create Topics
10.times do
 RegisteredApplication.create!(
   name:  Faker::Commerce.product_name,
   url: Faker::Internet.url,
   user_id: users.sample.id
 )
end
apps = RegisteredApplication.all

# Create events
30.times do
 Event.create!(
  name: Faker::Hacker.noun,
  registered_application: apps.sample
 )
end

events = Event.all
puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"