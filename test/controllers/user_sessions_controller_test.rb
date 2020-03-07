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
    assert_response :success
  end

  test "destroy session" do
    post '/logout'
    assert_response :redirect
  end

end
