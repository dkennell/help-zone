require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
    @help_desk = help_desks(:one)
  end

  test "visiting the Ticket index for a given HelpDesk" do
    visit help_desk_tickets_url(@help_desk)
    assert_selector "h1", text: "Listing tickets"
  end

  test "creating a Ticket for a HelpDesk" do
    visit help_desk_tickets_url(@help_desk)
    click_on "New Ticket"

    fill_in "Body", with: @ticket.body
    fill_in "Title", with: @ticket.title
    click_on "Save"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit help_desk_tickets_url(@help_desk)
    click_on "Edit", match: :first

    fill_in "Body", with: @ticket.body
    fill_in "Title", with: @ticket.title
    click_on "Save"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit help_desk_tickets_url(@help_desk)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
