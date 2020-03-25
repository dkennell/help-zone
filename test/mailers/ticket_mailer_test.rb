require 'test_helper'

class TicketMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "ticket_reply" do
    mail = TicketMailer.ticket_reply(@user)
    assert_equal "Ticket reply", mail.subject
    assert_equal ["davidkennell0@gmail.com"], mail.to
    assert_equal ["davidkennell0@gmail.com"], mail.to
    assert_match "This is a courtesy email to notify you that your ticket was received", mail.body.encoded
  end

end
