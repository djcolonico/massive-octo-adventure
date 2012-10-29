require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # set up a basic user
  setup do
    @user = User.new(:name => "Ned1", 
            :email => "ned@winterfell.com",
            :password => "winterfell",
            :password_confirmation => "winterfell")
    @user.save
  end

  # returns users
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  # renders a new user
  test "should get new" do
    get :new
    assert_response :success
  end

  # creating a user should redirect you to the login path
  # use post to simulate a POST HTTP request
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "something@email.com", 
                            name: "not_in_db_ye", 
                            password: "some_fake_digest",
                            password_confirmation: "some_fake_digest" }
    end
    assert_equal("User was successfully created.", flash.alert)
    assert_redirected_to login_path
  end

  # wont be directed to login_url so will not see the flash alert
  # becuase the name is not unique
  test "should not create user with a non-unique name" do
    post :create, user: { :name => "Ned1", 
                          :email => "ned@winterfell.com",
                          :password => "winterfell",
                          :password_confirmation => "winterfell" }
    assert_not_equal("User was successfully created.", flash.alert)
    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
