class UsersController < ApplicationController
  def show
    @user = User.find_by_username! params[:id]
  end

  def edit
    @user = User.find_by_username! params[:id]
  end

  def update
    @user = User.find_by_username! params[:id]
    if @user.update_attributes params[:user]
      redirect_to @user, notice: "Profile updated"
    else
      render :edit, alert: "Not quite"
    end
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
