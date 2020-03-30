require "application_system_test_case"
require "system/system_test_helper"

class HelpDesksTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    @help_desk = help_desks(:one)
    @organization = organizations(:one)
    @user = users(:one)
    login_user_post(@user)
  end

  test "visiting the index" do
    visit organization_help_desks_url(@organization)
    assert_selector "h3", text: "Help desks for: #{@organization.name}"
  end

  test "creating a Help desk" do
    visit organization_help_desks_url(@organization)
    click_on "+ New Help Desk"
    fill_in "help_desk_name", with: @help_desk.name, id: "help_desk_name"
    click_on "Save"

    assert_text "Help desk was successfully created"
    click_on "Back"
  end

  test "updating a Help desk" do
    visit organization_help_desks_url(@organization)
    find('[data-behavior="edit"]').click

    fill_in "help_desk_name", with: @help_desk.name
    click_on "Save"

    assert_text "Help desk was successfully updated"
    click_on "Back"
  end

  test "destroying a Help desk" do
    visit organization_help_desks_url(@organization)
    page.accept_confirm do
      find('[data-behavior="destroy"]').click
    end

    assert_text "Help desk was successfully destroyed"
  end
end
