require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'faker'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def random_mason
  	Mason.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
			email_address: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone,
			membership_number: Faker::String.unique.random(6))
  end
end
