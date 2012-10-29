require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :redirect #:success
  end

  test "should get destroy" do
    # user = User.new(:name => "Ned", 
    #         :email => "ned@winterfell.com",
    #         :password => "winterfell",
    #         :password_confirmation => "winterfell")

    # session[:user_id] = user.id
    get :create
    get :destroy
    assert_response :redirect #:success #:success
  end

end


# create should go to chatrooms url if true or login_url if false
# destroy should also be redirected to the login_url