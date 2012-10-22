class User < ActiveRecord::Base
  attr_accessible :name, :password, :email, :password_confirmation

  validates :name,
  			presence: true,
  			uniqueness: true,
			length: { minimum: 3,
                  maximum: 12,
                  too_long: "Username must be %{count} characters or less.",
                  too_short: "Username must be %{count} characters or more." }

  validates :email,
  			presence: true,
			format: { with: /\w+@\w+(\.\w+)+/,
			message: "Invalid email address." }

  validates :password,
  			length: { minimum: 6,
                  maximum: 50,
                  too_long: "Password must be %{count} characters or less.",
                  too_short: "Password must be %{count} characters or more." }

  validates :password_confirmation,
  			:presence => true
  has_secure_password
end
