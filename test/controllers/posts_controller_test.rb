require "test_helper"

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @owner = User.find_by_login "owner"
  end

  test "should get index" do
    assert_response :success
    assert_not_nil @post
  end

  test "should create post" do
    attrs = attributes_for :post
    post :create, post: attrs
    
    assert_equal attrs[:title], Post.last.title
    assert_response :redirect
  end

  test "should edit post" do
    post_attrs = attributes_for :post
    put :update, id: @post, post: post_attrs

    @post.reload

    assert_equal post_attrs[:title], @post.title
    assert_response :redirect
  end

  test "should show post" do
    get :show, id: @post
  end

  test "should delete post" do
    sign_in @owner
    delete :destroy, id: @post

    @post.reload

    assert_equal true, @post.deleted?
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: @post
  end
end
