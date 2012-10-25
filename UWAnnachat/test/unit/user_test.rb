require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a new User should have a name, email, password and password confirmation" do
  	# Errors will not be generated for a new obj automatically.
  	# Validations must be run with valid? / invalid? before they will be generated.
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:name].any?
  	assert user.errors[:password].any?
  	assert user.errors[:password_confirmation].any?
  	assert user.errors[:email].any?
  end

  test "a User name should be unique" do
  	# produce a valid user and save it to the db
  	stark = User.new(:name => "Ned", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert stark.save # will check validations

  	# another User with the same name should not be valid
  	# validation errors in name should be present
  	copy = User.new(:name => "Ned", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert !copy.valid?
  	assert copy.errors[:name].any?
  end

  test "a user name should be longer than 3 characters" do
  	stark = User.new(:name => "Ne", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert stark.invalid?
  	# assert stark.errors[:name].any?
  	# assert_equal("Username must be 3 characters or more.", stark.errors[:name][0])
  end

  test "a user name should not be greater than 12 characters" do
  	stark = User.new(:name => "GreaterThanTh", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert stark.invalid?
  	# assert stark.errors[:name].any?
  	# assert_equal("Username must be 12 characters or less.", stark.errors[:name][0])
  end

  





end
