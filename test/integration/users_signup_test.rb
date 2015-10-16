require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


    test "invalid sign up information" do
        get signup_path
        assert_no_difference "User.count"  do
            post users_path, user: { name:" ",
                email: "invalid", password: "foo", password_confirmation: "bar" }
        end
        assert_template 'users/new'
    end

    test "valid sign up information" do
        get signup_path
        assert_difference "User.count", 1  do
            post users_path, user: { name:"example user",
                email: "user@example.com", password: "password", password_confirmation: "password" }
        end
        assert is_logged_in?
    end


end
