require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create :comment
  end

  test "should create comment" do 
    attrs = attributes_for :comment

    assert_difference("Comment.count") do
      post :create, post_id: @comment.post, comment: attrs
    end
    
    assert_response :redirect
  end

  test "should destroy comment" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")

    assert_difference("Comment.count", -1) do
      delete :destroy, id: @comment, post_id: @comment.post
    end

    assert_response :redirect
  end
end
