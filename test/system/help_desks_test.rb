require "application_system_test_case"

class HelpDesksTest < ApplicationSystemTestCase
  setup do
    @help_desk = help_desks(:one)
    @organizatinon = organizations(:one)
  end

  test "visiting the index" do
    visit organization_help_desks_url
    assert_selector "h1", text: "Help Desks"
  end

  test "creating a Help desk" do
    visit organization_help_desks_url(@organization)
    click_on "New Help Desk"

    fill_in "Name", with: @help_desk.name
    fill_in "Organization", with: @help_desk.organization
    click_on "Create Help desk"

    assert_text "Help desk was successfully created"
    click_on "Back"
  end

  test "updating a Help desk" do
    visit organization_help_desks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @help_desk.name
    fill_in "Organization", with: @help_desk.organization
    click_on "Update Help desk"

    assert_text "Help desk was successfully updated"
    click_on "Back"
  end

  test "destroying a Help desk" do
    visit organization_help_desks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Help desk was successfully destroyed"
  end
end
