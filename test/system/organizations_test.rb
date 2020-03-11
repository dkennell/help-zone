require "application_system_test_case"
require "system/system_test_helper"

class OrganizationsTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    @organization = organizations(:one)
    @user = users(:organization_admin_one)
    @user.organizations <<  @organization
    login_user_post(@user)
    # Wait for Organizations page to load before proceeding to individual
    # tests. This prevents failures from race conditions in Capybara.
    find_by_id("page-heading")
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h3", text: "Your organizations"
  end

  test "institution admins only see their own organizations" do
    @second_organization = organizations(:two)
    assert_text @organization.name
    assert_no_text @second_organization.name
  end

  test "creating a Organization" do
    visit organizations_url
    click_on "+ New organization"
    fill_in 'organization_name', with: "My new organization"
    click_on "Create organization"

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
      find('[data-behavior="destroy"]').click
    end

    assert_text "Organization was successfully destroyed"
  end
end
