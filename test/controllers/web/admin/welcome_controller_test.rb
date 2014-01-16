require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  setup do
    @approved_user = create :approved_user
    sign_in @approved_user
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
