class CommentsMailbox < ApplicationMailbox
  def process
    ticket_id = get_ticket_id(body: mail.text_part.decoded)
    if ticket_id
      build_comment_from_email(mail, ticket_id)
    else
      open_new_ticket(mail)
    end
  end

  def get_ticket_id(body: "")
    id_opening_tag = body.index('<start_id>')
    id_closing_tag = body.index('<end_id>')
    return nil if [id_opening_tag, id_closing_tag].include?(nil)
    
    start_index = id_opening_tag + 10
    end_index = id_closing_tag - 1
    ticket_id_string = body[start_index..end_index]
    return ticket_id_string.to_i
  end

  def build_comment_from_email(mail, ticket_id)
    comment_body = EmailReplyParser.parse_reply(mail.text_part.decoded)
    Comment.create(
      body: comment_body,
      ticket_id: ticket_id,
      author: mail.from[0]
    )
  end

  def open_new_ticket(mail)
    destination_email_address = mail.to[0]
    sender_email_address = mail.from[0]
    email_subject = mail.subject
    destination_email_user = destination_email_address.split('@').first
    help_desk = HelpDesk.find_by(name: destination_email_user)
    ticket = HelpDesk.tickets.build(
      email: sender_email_address,
      title: email_subject,
      body: EmailReplyParser.parse_reply(mail.text_part.decoded)
    )
    ticket.save
  end

  # Incoming emails are expected to contain a ticket ID
  # between <start_id> and <end_id> tags. Example follows.

  # Example Email
  # ---------------

  # Hello I would like assistance with such and such please.
  
  # ======================================
  # Do not alter content below this line
  # ======================================
  
  # Ticket ID: <start_id>20<end_id>
end
