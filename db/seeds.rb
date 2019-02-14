# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all


10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::Lorem.paragraph(20), password: Faker::Space.agency)
end

7.times do

events = Event.create!( title: Faker::Lorem.characters(6), description: Faker::ChuckNorris.fact, start_date: Time.now+3.day, duration: rand(1..10)*5, location: Faker::Address.city, price: rand(1..1000), user_id: (rand(User.first.id..User.last.id)))
end

5.times do

attendance = Attendance.create!(user_id: (rand(User.first.id..User.last.id)), event_id: (rand(Event.first.id..Event.last.id)))

end
