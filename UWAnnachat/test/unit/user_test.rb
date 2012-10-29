require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # TEST PRESENCE #  

  test "a new User should have a name, email, password and password confirmation" do
  	# errors will not be generated for a new obj automatically.
  	# validations must be run with valid? / invalid? before they will be generated.
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:name].any?
  	assert user.errors[:password].any?
  	assert user.errors[:password_confirmation].any?
  	assert user.errors[:email].any?
  end


  # NAME TESTS #

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

  test "a User name should be longer than 3 characters" do
  	stark = User.new(:name => "Ne", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert stark.invalid?
  	assert stark.errors[:name].any?
  	assert_equal("Username must be 3 characters or more.", stark.errors[:name][0])
  end

  test "a User name that is too small should return the correct error message" do
    stark = User.new(:name => "Ne", 
            :email => "ned@winterfell.com",
            :password => "winterfell",
            :password_confirmation => "winterfell")
    assert stark.invalid?
    assert_equal("Username must be 3 characters or more.", stark.errors[:name][0])
  end

  test "a User name should not be greater than 12 characters" do
  	stark = User.new(:name => "GreaterThanTh", 
  					:email => "ned@winterfell.com",
  					:password => "winterfell",
  					:password_confirmation => "winterfell")
  	assert stark.invalid?
    assert stark.errors[:name].any?
  	assert_equal("Username must be 12 characters or less.", stark.errors[:name][0])
  end

  test "a User name that is too large should return the correct error message" do
    stark = User.new(:name => "GreaterThanTh", 
            :email => "ned@winterfell.com",
            :password => "winterfell",
            :password_confirmation => "winterfell")
    assert stark.invalid?
    assert_equal("Username must be 12 characters or less.", stark.errors[:name][0])
  end


  # EMAIL TESTS #

  # redundant test?
  test "a User must have a valid email format" do
    joe = User.new(:name => "Joe", 
          :email => "joe@email.com",
          :password => "yoyomamajoe",
          :password_confirmation => "yoyomamajoe")
    assert joe.valid?
  end

  test "a User cannot have an invalid email format" do
    joe = User.new(:name => "Joe", 
          :email => "",
          :password => "yoyomamajoe",
          :password_confirmation => "yoyomamajoe")

    # let "joe@email.com" be  a valid email
    # then have invalid versions of this email
    invalid = ["@email.com", "email.com", ".com", 
               "joe@email.", "joe@email", "joe@",
               "joe", "@.", "@", ".", "email.", "@email"]

    # test that each email type is bad
    invalid.each do |bad_email|
      joe.email = bad_email
      assert joe.invalid?
      assert joe.errors[:email].any?
      assert_equal("Invalid email address.", joe.errors[:email][0])
    end
  end


  # PASSWORD TESTS #

  test "a User password should not be less than 6 characters long" do
    user = User.new(:name => "Joe", 
          :email => "joe@email.com",
          :password => "passw",
          :password_confirmation => "passw")
    assert user.invalid?
    assert user.errors[:password].any?
  end

  test "a User password that is too small should return the correct error message" do
    user = User.new(:name => "Joe", 
          :email => "joe@email.com",
          :password => "passw",
          :password_confirmation => "passw")
    assert user.invalid?
    assert_equal("Password must be 6 characters or more.", user.errors[:password][0])
  end

  test "a User password should not be greater than 50 characters long" do
     user = User.new(:name => "Joe", 
          :email => "joe@email.com",
          :password => "this_can_not_be_greater_than_fifty_characters_error",
          :password_confirmation => "this_can_not_be_greater_than_fifty_characters_error")
    assert user.invalid?
    assert user.errors[:password].any?
  end

  test "a User password that is too long should return the correct error message" do
    user = User.new(:name => "Joe", 
          :email => "joe@email.com",
          :password => "this_can_not_be_greater_than_fifty_characters_error",
          :password_confirmation => "this_can_not_be_greater_than_fifty_characters_error")
    assert user.invalid?
    assert_equal("Password must be 50 characters or less.", user.errors[:password][0])
  end

  # has_secure_password to be tested

end
