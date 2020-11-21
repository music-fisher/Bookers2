class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followings
  end
end
