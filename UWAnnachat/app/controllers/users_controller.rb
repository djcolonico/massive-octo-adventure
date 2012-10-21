class UsersController < ApplicationController

 def index
    @users = User.all
  end

  def show
	  @user = User.find(params[:id])
  end

  def new
	  @user = User.new
  end

  def create
	  @user = User.new(
      :username => params[:user][:username],
      :password  => params[:user][:password],
      :password_confirmation  => params[:user][:password_confirmation],
      :email => params[:user][:email])
  	@user.save
  	

  	redirect_to chatrooms_path
  end
end
