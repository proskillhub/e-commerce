class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user1= User.find(1).roles
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
