require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create :post_comment
  end

  test "should create comment" do 
    sign_in @comment.user
    attrs = attributes_for :post_comment
    attrs[:user_id] = @comment.user.id

    post :create, post_id: @comment.post, comment: attrs

    assert_equal attrs[:body], Post::Comment.last.body
    assert_response :redirect
  end

  test "should destroy comment" do
    sign_in @comment.user
    delete :destroy, id: @comment, post_id: @comment.post

    assert !Post::Comment.exists?(@comment)
    assert_response :redirect
  end
end
