require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  setup do
    @owner = create :owner
    sign_in @owner
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
