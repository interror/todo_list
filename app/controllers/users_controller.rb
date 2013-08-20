class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user].permit(:email, :password, :password_confirmation))
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		render new_user_path
  	end
  end
  
end
