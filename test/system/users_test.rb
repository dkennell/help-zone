require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "index renders successfully" do
    visit users_url
    assert_selector "h1", text: "Listing users"
  end

  test "user index shows emails of all users" do
    visit users_url
    user = users(:one)
    assert_text user.email
  end

  test "creating a User" do
    visit users_url
    click_on "New User"
    fill_in 'user_email', with: "bloop@gmail.com"
    fill_in 'user_password', with: "password"

    click_on "Save"

    assert_text "User was successfully created"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    click_on "Save"

    assert_text "User was successfully updated"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
