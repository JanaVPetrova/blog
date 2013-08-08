require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create :comment
  end

  test "should create comment" do 
    sign_in @comment.user
    attrs = attributes_for :comment
    attrs[:user_id] = @comment.user.id

    post :create, post_id: @comment.post, comment: attrs

    assert_equal attrs[:commenter], Comment.last.commenter
    assert_response :redirect
  end

  test "should destroy comment" do
    delete :destroy, id: @comment, user_id: @comment.post.user, post_id: @comment.post

    assert !Comment.exists?(@comment)
    assert_response :redirect
  end
end
