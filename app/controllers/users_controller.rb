class UsersController < ApplicationController
  def show
    @user = User.find_by_username! params[:id]
  end

  def follow
    @user = User.find_by_username! params[:id]
    current_user.follower_follows.create! followee: @user
    redirect_to :back, notice: "Following #{@user}"
  end

  def unfollow
    @user = User.find_by_username! params[:id]
    current_user.follower_follows.where(followee_id: @user.id).destroy_all
    redirect_to :back, notice: "No longer following #{@user}"
  end
end
