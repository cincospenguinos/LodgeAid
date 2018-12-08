# == Schema Information
#
# Table name: user_accounts
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  permissions     :integer
#  mason_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  verified        :boolean
#

require 'test_helper'

class UserAccountTest < ActiveSupport::TestCase

	setup do
		@master = Mason.create!(first_name: 'Joe', last_name: 'Blow', officer_position: :worshipful_master, membership_number: Faker::String.unique.random(5))
		@secretary = Mason.create!(first_name: 'Joe', last_name: 'Blow', officer_position: :secretary, membership_number: Faker::String.unique.random(5))
		@tyler = Mason.create!(first_name: 'Joe', last_name: 'Blow', officer_position: :tyler, membership_number: Faker::String.unique.random(5))
		@mason = Mason.create!(first_name: 'Joe', last_name: 'Blow',membership_number: Faker::String.unique.random(5))
	end

  test 'Elected officers, tylers, and secretaries should be admins' do
  	some_guy = UserAccount.create!(mason: @master, username: 'guy', password: 'password')
  	assert(some_guy.is_admin?)
  	some_guy = UserAccount.create!(mason: @secretary, username: 'another_guy', password: 'password')
  	assert(some_guy.is_admin?)
  	some_guy = UserAccount.create!(mason: @secretary, username: 'still_another_guy', password: 'password')
  	assert(some_guy.is_admin?)
  end

  test 'Masons who are not elected officers must not be admins' do
  	user = UserAccount.create!(mason: @mason, username: 'still_another', password: 'password')
  	assert(!user.is_admin?)
  end

  test 'Usernames are unique' do
  	UserAccount.create!(mason: @master, username: 'TheDude', password: 'password')
  	assert_raises(Exception) { UserAccount.create!(mason: @mason, username: 'TheDude', password: 'password')}
  end

  test 'Passwords have a length of six' do
    UserAccount.create!(mason: @master, username: 'SomeDude', password: 'password')
    assert_raises(Exception) { UserAccount.create!(mason: @master, username: 'SomeDude', password: 'pass') }
  end

  test 'Password and password confirmation are the same' do
    UserAccount.create!(mason: @master, username: 'SomeOtherOtherDude', password: 'password', password_confirmation: 'password')
    assert_raises(Exception) { UserAccount.create!(mason: @master, username: 'SomeOtherDude', password: 'password', password_confirmation: 'passwor') }
  end
end
