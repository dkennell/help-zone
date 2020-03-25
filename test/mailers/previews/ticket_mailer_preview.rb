# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/ticket_reply
  def ticket_reply
    TicketMailer.ticket_reply(Ticket.last)
  end

end
