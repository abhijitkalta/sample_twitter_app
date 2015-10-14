require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title" , "Sign up"
  end

end
