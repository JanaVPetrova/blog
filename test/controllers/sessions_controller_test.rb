require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should login" do
    attrs = { login: @user.login, password: @user.password }
    post :create, user: attrs

    assert_response :redirect
    assert signed_in?
  end

  test "should logout" do
    delete :destroy

    assert_response :redirect
    assert !signed_in?
  end
end
