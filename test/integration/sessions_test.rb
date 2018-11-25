require 'test_helper'

class SessionsTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: { username: '', password: ''}}
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end

  test 'login with valid information' do
  	skip 'This needs to be implemented'
  	get login_path
  	assert_template 'sessions/new'
  end
end
