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

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end
end
