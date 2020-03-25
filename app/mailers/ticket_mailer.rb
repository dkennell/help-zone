class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.ticket_reply.subject
  #

  #let's rename this reply_to_ticket
  def ticket_reply(ticket)
    @greeting = "Hi"

    mail subject: "Replying to ticket"
    mail to: ticket.email
    mail from: 'davidkennelltest@gmail.com'
  end
end
