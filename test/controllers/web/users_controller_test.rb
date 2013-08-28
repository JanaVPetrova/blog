require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @owner = create :owner
  end

  test "should create user" do
    attrs = attributes_for :user

    post :create, user: attrs
    assert_response :redirect

    assert { User.last.login == attrs[:login] }
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
    sign_in @user
    attrs = attributes_for :user
    post :update, id: @user, user: attrs
    assert_response :redirect

    @user.reload
    assert { attrs[:login] == @user.login }
  end

  test "should destroy user" do
    sign_in @owner
    delete :destroy, id: @user
    assert_response :redirect

    assert { !User.exists?(@user) }
  end
end
