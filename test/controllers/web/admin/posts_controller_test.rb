require 'test_helper'

class Web::Admin::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @post.publish
    @owner = create :owner
    sign_in @owner
  end

  test "should get index" do
    get :index
    assert_response :success
    assert { @post }
  end

  test "should create post" do
    sign_in @owner
    attrs = attributes_for :post, subject_id: @post.subject
    post :create, post: attrs
    assert_response :redirect

    assert { attrs[:title] == Post.last.title }
  end

  test "should edit post" do
    sign_in @owner

    post_attrs = attributes_for :post
    put :update, id: @post, post: post_attrs
    assert_response :redirect

    @post.reload

    assert { post_attrs[:title] == @post.title }
  end

  test "should delete post" do
    sign_in @owner
    delete :destroy, id: @post
    assert_response :redirect

    @post.reload

    assert { @post.deleted? }
  end

  test "should get edit" do
    sign_in @owner

    get :edit, id: @post
    assert_response :success
  end
end
