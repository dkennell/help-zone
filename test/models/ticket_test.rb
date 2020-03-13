require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  setup do
    @help_desk = help_desks(:one)
    @ticket = Ticket.new(email: "yo@hey.com", title: "yay", body: "woot")
    @help_desk.tickets << @ticket
  end

  test "ticket can be created" do
    assert @ticket.valid?
  end

  test "email is required" do
    @ticket.email = nil
    assert @ticket.invalid?
  end

  test "title is required" do
    @ticket.title = nil
    assert @ticket.invalid?
  end

  test "body is required" do
    @ticket.body = nil
    assert @ticket.invalid?
  end
end
