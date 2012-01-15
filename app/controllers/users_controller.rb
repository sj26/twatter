class UsersController < ApplicationController
  before_filter :only_current_user_may_edit, only: [:edit, :update]
  before_filter :current_user_may_not_follow_self, only: [:follow, :unfollow]

  def show
  end

  def edit
  end

  def update
    if user.update_attributes params[:user]
      redirect_to user, notice: "Profile updated"
    else
      render :edit, alert: "Not quite"
    end
  end

  def follow
    current_user.follower_follows.create! followee: user
    redirect_to :back, notice: "Following #{user}"
  end

  def unfollow
    current_user.follower_follows.where(followee_id: user.id).destroy_all
    redirect_to :back, notice: "No longer following #{user}"
  end

protected

  def user
    @user ||= User.find_by_username! params[:id]
  end
  helper_method :user

  def only_current_user_may_edit
    head :unauthorized unless user == current_user
  end

  def current_user_may_not_follow_self
    head :bad_request if user == current_user
  end
end
