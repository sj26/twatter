class FolloweesController < ApplicationController
  layout "user"

protected

  def user
    @user ||= User.find_by_username! params[:user_id]
  end
  helper_method :user
end
