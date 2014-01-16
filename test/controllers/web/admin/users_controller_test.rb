require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user

    @owner = create :owner
    sign_in @owner
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should patch update" do
    attrs = attributes_for :user

    patch :update, id: @user, user: attrs
    assert_response :redirect

    @user.reload
    assert { @user.login == attrs[:login] }
  end

  test "should patch update to approve user" do
    patch :update, id: @user, user: { approvement_state_event: :approve }
    assert_response :redirect

    @user.reload
    assert { @user.approved? }
  end
end
