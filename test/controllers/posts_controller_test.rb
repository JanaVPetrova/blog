require "test_helper"

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should create post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")
    
    assert_difference("Post.count") do
      post :create, post: {title: "Some title"}
    end
    
    assert_redirected_to post_path(assigns(:post))
  end

  test "should edit post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")
    
    old_post = Post.all.first
    post_attrs = {title: "Some new title"}

    put :update, id: old_post, post: post_attrs

    assert_redirected_to post_path(assigns(:post))

    old_post.reload
    assert_equal post_attrs[:title], old_post.title
  end

  test "should show post" do
    post = Post.all.first

    get :show, id: post
  end

  test "should destroy post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")

    post = Post.all.first

    assert_difference("Post.count", -1) do
      delete :destroy, id: post
    end
    
    assert_redirected_to posts_path
  end
end
