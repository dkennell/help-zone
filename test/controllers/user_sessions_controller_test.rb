require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "new session" do
    get '/login'
    assert_response :success
  end

  test "create session" do
    user = users(:one)
    post user_sessions_url, params: {
      email: user.email,
      password: "password"
    }
    assert_redirected_to :organizations
  end

  test "destroy session" do
    post '/logout'
    assert_redirected_to 'login'
  end

end
