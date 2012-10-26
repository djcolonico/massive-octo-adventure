class ChatroomsController < ApplicationController
	def index
		  @chatrooms = Chatroom.all
		  @user = User.find(session[:user_id])
		  @user.update_attribute(:chatroom_id,nil)
	end

	def show
		@chatrooms = Chatroom.all
		@chatroom = Chatroom.find(params[:id])
	    @message = Message.new
		@message.chatroom_id = @chatroom.id
		@user = User.find(session[:user_id])
		@user.update_attribute(:chatroom_id, @chatroom.id)
	end

	def new
		@chatroom = Chatroom.new
  end

   def create
		@chatroom = Chatroom.new(:name => params[:chatroom][:name])
    	@chatroom.save
    	redirect_to chatroom_path(@chatroom)
  end
  
end
