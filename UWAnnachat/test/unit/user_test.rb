require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # validation tests for a new User
  test "a new model validates pesence of attributes" do
  	user = User.new
  	assert user.errors[:name].any?
  	assert user.errors[:password].any?
  	assert user.errors[:password_confirmation].any?
  	assert user.errors[:email].any?
  end

end
