class CommentsMailbox < ApplicationMailbox
  def process
    # Temporary comment creation flow; will change once this is tested in prod.
    Comment.create(body: mail.decoded, ticket_id: Ticket.first.id)
  end
end
