require "application_system_test_case"
require "system/system_test_helper"

class UserSessionsTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    @user = users(:one)
  end

  test "visit the login page" do
    visit "/"
    assert_text "Login"
  end

  test "log in" do
    visit "/"
    login_user_post(@user)
    assert_text "Your organizations"
  end
end
