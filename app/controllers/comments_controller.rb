class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to ticket_path(comment.ticket_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author, :ticket_id)
  end
end
