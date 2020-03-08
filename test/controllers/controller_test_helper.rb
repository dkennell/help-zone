module ControllerTestHelper
  def login_user_post(user)
    post user_sessions_url, params: {
      email: user.email,
      password: 'password'
    }
  end
end
