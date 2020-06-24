class CommentsMailbox < ApplicationMailbox
  def process
    Comment.create(body: mail.decoded, ticket_id: get_ticket_id(body: mail.decoded))
  end

  def get_ticket_id(body: "")
    start_index = body.index('<start_id>') + 10
    end_index = body.index('<end_id>') - 1
    ticket_id_string = body[start_index..end_index]
    return ticket_id_string.to_i
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
