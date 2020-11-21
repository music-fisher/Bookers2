class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
