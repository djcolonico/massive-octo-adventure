class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation

  validates :password,
  			presence: true,
  			length: { minimum: 6, maximum: 50 }

  validates :password_confirmation,
        presence: true

  validates :username,
  			presence: true,
  			length: { minimum: 3, maximum: 12 }

  EMAIL_REGEX = /\w+@\w+(.\w+)+/
  validates :email,
  			presence: true,
  			format: { with: EMAIL_REGEX },
  			uniqueness: { case_sensitive: false }

  def valid_password?
    password == password_cofirmation
  end
end