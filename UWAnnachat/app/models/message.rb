class Message < ActiveRecord::Base
  attr_accessible :author, :body

  belongs_to :chatroom
end
