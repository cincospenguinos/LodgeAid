require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
  	skip 'This needs to be checked'
    get meetings_new_url
    assert_response :success
  end

  test "should get show" do
  	skip 'This needs to be checked'
    get meetings_show_url
    assert_response :success
  end

end
