class CommentsMailbox < ApplicationMailbox
  def process
    ticket_id = get_ticket_id(body: mail.decoded)
    comment_body = comment_body_from_email(email_body: mail.decoded)
    Comment.create(
      body: comment_body,
      ticket_id: ticket_id,
      author: mail.from[0]
    )
  end

  def get_ticket_id(body: "")
    start_index = body.index('<start_id>') + 10
    end_index = body.index('<end_id>') - 1
    ticket_id_string = body[start_index..end_index]
    return ticket_id_string.to_i
  end

  def comment_body_from_email(email_body: '')
    divider_index = email_body.index('======================================')
    return email_body[0..divider_index - 1]
  end

  # Incoming emails are expected to adhere to a certain format such that comments can
  # reliably be generated from them. Example follows.

  # Example Email
  # ---------------

  # Hello I would like assistance with such and such please.
  
  # ======================================
  # Do not alter content below this line
  # ======================================
  
  # Ticket ID: <start_id>20<end_id>
end
