require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @ticket = tickets(:one)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { ticket_id: @ticket.id } }
    end
  end
end
