class Chatroom < ActiveRecord::Base
  attr_accessible :name, :user_id, :message_id
end
