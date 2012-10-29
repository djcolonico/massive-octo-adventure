require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  # set up a basic user
  setup do
    @user = User.new(:name => "Ned1", 
            :email => "ned@winterfell.com",
            :password => "winterfell",
            :password_confirmation => "winterfell")
    @user.save
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # right password
  test "create for a valid login" do
     # use the params hash to pass in any data we need for the method
     post :create, { :name => "Ned1", :password => "winterfell" }
     assert_redirected_to chatrooms_url
  end

  # wrong password
  test "create for an invalid login" do
     post :create, { :name => "Ned1", :password => "not_winterfell" }
     assert_redirected_to login_url
  end

  # error message: ActiveRecord::RecordNotFound: Couldn't find User without an ID
  # test "should get destroy" do
  #   # simulate a DELETE HTTP request
  #   delete :destroy, :user_id => @user.id 

  #   #test that we are redirected to the right page
  #   assert_redirected_to login_url
  # end
  
end