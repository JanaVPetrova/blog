require "test_helper"

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test "should get index" do
    assert_response :success
    assert_not_nil @post
  end

  test "should create post" do
    attrs = attributes_for :post

    assert_difference("Post.count") do
      post :create, user_id: @post.user, post: attrs
    end
    
    assert_redirected_to user_posts_path
  end

  test "should edit post" do
    post_attrs = attributes_for :post
    put :update, user_id: @post.user, id: @post, post: post_attrs

    @post.reload
    assert_equal post_attrs[:title], @post.title

    assert_response :redirect
  end

  test "should show post" do
    get :show, user_id: @post.user, id: @post
  end

  test "should delete post" do
    delete :destroy, user_id: @post.user, id: @post

    @post.reload
    assert_equal @post.deleted?, true

    assert_redirected_to user_posts_path
  end

  test "should get edit" do
    get :edit, user_id: @post.user, id: @post
  end
end
