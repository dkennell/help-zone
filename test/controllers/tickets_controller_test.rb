require 'test_helper'
require "controllers/controller_test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper

  setup do
    @ticket = tickets(:one)
    @help_desk = help_desks(:one)
  end

  test "should get help desk ticket index" do
    get help_desk_tickets_url(@help_desk)
    assert_response :success
  end

  test "should get new help desk ticket page" do
    get new_help_desk_ticket_url(@help_desk)
    assert_response :success
  end

  test "should create a ticket for a given help desk" do
    assert_difference('Ticket.count') do
      post help_desk_tickets_url(@help_desk), params: { ticket: {email: @ticket.email, body: @ticket.body, help_desk_id: @ticket.help_desk_id, title: @ticket.title } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    @user = users(:one)
    login_user_post(@user)
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: {email: @ticket.email, body: @ticket.body, help_desk_id: @ticket.help_desk_id, title: @ticket.title } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to help_desk_tickets_url(@help_desk)
  end
end
