require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should create comment" do 
    assert_difference("Comment.count") do
      post :create, post_id: Post.last.id, comment: {commenter: "Some commenter"}
    end
    
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy comment" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")

    comment = Post.last.comments.create(commenter: "commenter1")
    
    assert_difference("Comment.count", -1) do
      delete :destroy, id: comment, post_id: Post.last.id
    end

    assert_redirected_to post_path(assigns(:post))
  end

end
