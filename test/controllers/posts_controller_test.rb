require "test_helper"

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil @post
  end

  test "should create post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")
    
    attrs = attributes_for :post

    post :create, post: attrs
    assert_equal Post.last.title, attrs[:title]
    
    assert_redirected_to posts_path
  end

  test "should edit post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")
    
    post_attrs = attributes_for :post
    put :update, id: @post, post: post_attrs

    @post.reload
    assert_equal post_attrs[:title], @post.title

    assert_response :redirect
  end

  test "should show post" do
    get :show, id: @post
  end

  test "should destroy post" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")

    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    
    assert_redirected_to posts_path
  end

  test "should get edit" do
    get :edit, id: @post
  end
end
