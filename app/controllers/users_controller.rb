class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book =Book.new
  end
end
