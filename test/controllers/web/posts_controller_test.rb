require "test_helper"

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @post.publish
  end

  test "should get index" do
    get :index
    assert_response :success
    assert { @post }
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end
end
