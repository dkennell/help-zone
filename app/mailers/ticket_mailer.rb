class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.ticket_reply.subject
  #

  #let's rename this reply_to_ticket
  def send_ticket_comment(comment)
    @greeting = "Hi"

    mail subject: "Replying to ticket"
    mail to: comment.ticket.email
    mail from: 'customer_service@thehelpzoneproject.com'
  end
end
