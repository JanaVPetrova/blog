require 'test_helper'

class Web::Admin::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @post.publish

    @approved_user = create :approved_user
    sign_in @approved_user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert { @post }
  end

  test "should create post" do
    attrs = attributes_for :post, subject_id: @post.subject
    post :create, post: attrs
    assert_response :redirect

    assert { attrs[:title] == Post.last.title }
  end

  test "should edit post" do

    post_attrs = attributes_for :post
    put :update, id: @post, post: post_attrs
    assert_response :redirect

    @post.reload

    assert { post_attrs[:title] == @post.title }
  end

  test "should delete post" do
    delete :destroy, id: @post
    assert_response :redirect

    @post.reload

    assert { @post.deleted? }
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end
end
