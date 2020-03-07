require "application_system_test_case"

class UserSessionsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visit the login page" do
    visit "/"
    assert_text "Login"
  end

  test "log in" do
    visit "/"
    fill_in "email", with: "davidkennell0@gmail.com"
    fill_in "password", with: "password"
    click_on "Login"
    assert_text "Listing users"
  end
end
