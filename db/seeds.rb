# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create a few masons
10.times do
	Mason.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
		email_address: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone,
		membership_number: Faker::String.unique.random(6))
end

# Create a meeting or two
Meeting.create!(name: 'Now Stated Meeting', meeting_type: :business, date_occurred: Faker::Time.between(1.days.ago, Date.today, :night))