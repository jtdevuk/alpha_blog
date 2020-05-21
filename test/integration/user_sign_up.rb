require 'test_helper'

class UserSignUp < ActionDispatch::IntegrationTest

  test "user sign up and redirect to articles path" do
    get 'users/new'
    assert_template 'signup_path'
    assert_difference 'Users.count', 1 do
      post users_path, params: { user: {username: "Richard", password: "123456", email: "richard@king.com"}}
      follow_redirect!
      assert_template 'articles_path'
    end
  end

end
