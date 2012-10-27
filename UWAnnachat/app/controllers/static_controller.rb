class StaticController < ApplicationController
	skip_before_filter :authorize

	def home
		if (User.find_by_id(session[:user_id]))
			User.find(session[:user_id]).update_attribute(:chatroom_id, nil)
		end
	end

	def about
		if (User.find_by_id(session[:user_id]))
			User.find(session[:user_id]).update_attribute(:chatroom_id, nil)
		end
	end

	def rules
		if (User.find_by_id(session[:user_id]))
			User.find(session[:user_id]).update_attribute(:chatroom_id, nil)
		end
	end

	def faq
		if (User.find_by_id(session[:user_id]))
			User.find(session[:user_id]).update_attribute(:chatroom_id, nil)
		end
	end
end
