class CommentsMailbox < ApplicationMailbox
  def process
    ticket_id = get_ticket_id(body: mail.text_part.decoded)
    comment_body = EmailReplyParser.parse_reply(mail.text_part.decoded)
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
