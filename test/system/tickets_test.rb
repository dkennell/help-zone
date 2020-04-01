require "application_system_test_case"
require "system/system_test_helper"

class TicketsTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    @ticket = tickets(:one)
    @help_desk = help_desks(:one)
    @user = users(:one)
  end

  test "visiting the Ticket index for a given HelpDesk" do
    visit help_desk_tickets_url(@help_desk)
    assert_selector "h3", text: "Tickets for help desk: #{@help_desk.name}"
  end

  test "creating a Ticket for a HelpDesk" do
    login_user_post(@user)
    visit help_desk_tickets_url(@help_desk)
    click_on "New Ticket"

    fill_in "Body", with: @ticket.body
    fill_in "Title", with: @ticket.title
    fill_in "Email", with: "customer_email@gmail.com"
    click_on "Save"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    login_user_post(@user)
    visit help_desk_tickets_url(@help_desk)
    first('[data-behavior="edit"]').click

    fill_in "Body", with: @ticket.body
    fill_in "Title", with: @ticket.title
    click_on "Save"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit help_desk_tickets_url(@help_desk)
    page.accept_confirm do
      first('[data-behavior="destroy"]').click
    end

    assert_text "Ticket was successfully destroyed"
  end

  test "commenting on a Ticket" do
    login_user_post(@user)
    visit ticket_url(@ticket)
    fill_in "comment_body", with: "This is a comment"
    click_on "Create Comment"
    assert_text "Comment by #{@user.email}"
  end
end
