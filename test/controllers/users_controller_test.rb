require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @owner = create :owner
  end

  test "should create user" do
    attrs = attributes_for :user

    post :create, user: attrs

    assert_equal User.last.login, attrs[:login]
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end

  test "should update user" do
    attrs = attributes_for :user
    post :update, id: @user, user: attrs

    @user.reload
    assert_equal attrs[:login], @user.login
  end

  test "should destroy user" do
    sign_in @owner
    delete :destroy, id: @user

    assert !User.exists?(@user)
  end
end
