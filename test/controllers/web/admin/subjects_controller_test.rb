require 'test_helper'

class Web::Admin::SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = create :subject

    @approved_user = create :approved_user
    sign_in @approved_user
  end

  test "should get index"  do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject" do
    attrs = attributes_for :subject
    post :create, subject: attrs
    assert_response :redirect

    assert { attrs[:title] == Subject.last.title }
  end
end
