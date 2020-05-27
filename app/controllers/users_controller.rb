class UsersController < ApplicationController

  if User.count === 0 
    skip_before_action :authorized
  end

  def new
    @user = User.new
  end

  def create   
    @user = User.create(params.require(:user).permit(:username,:password))   
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end
