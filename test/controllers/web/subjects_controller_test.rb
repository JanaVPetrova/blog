require 'test_helper'

class Web::SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = create :subject
  end

  test "should get index" do
    get :index
    assert_response :success
    assert { @subject }
  end

  test "should show subject" do
    get :show, id: @subject
    assert_response :success
  end
end
