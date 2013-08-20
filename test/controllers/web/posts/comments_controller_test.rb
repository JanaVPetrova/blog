require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create 'post/comment'
  end

  test "should create comment" do
    sign_in @comment.user
    attrs = attributes_for 'post/comment'
    attrs[:user_id] = @comment.user.id

    post :create, post_id: @comment.post, post_comment: attrs
    assert_response :redirect

    assert_equal attrs[:body], Post::Comment.last.body
  end

  test "should destroy comment" do
    sign_in @comment.user
    delete :destroy, id: @comment, post_id: @comment.post
    assert_response :redirect

    assert !Post::Comment.exists?(@comment)
  end
end
