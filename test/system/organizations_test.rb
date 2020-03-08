require "application_system_test_case"
require "system/system_test_helper"

class OrganizationsTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "institution admins only see their own organizations" do
    @second_organization = organizations(:two)
    @user = users(:organization_admin_one)
    @user.organizations <<  @organization
    @user.password = "password"
    @user.save
    login_user_post(@user)
    assert_text @organization.name
    assert_no_text @second_organization.name
  end

  test "creating a Organization" do
    visit organizations_url
    click_on "New Organization"

    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit organizations_url
    click_on "Edit", match: :first

    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
