require 'test_helper'

class Web::Subjects::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
  end

  test "should get index" do
    get :index, subject_id: @post.subject
    assert_response :success
  end
end
