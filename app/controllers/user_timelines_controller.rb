class UserTimelinesController < TimelineController

protected

  def tweets
    @tweets ||= user.tweets.order("tweets.created_at desc")
  end
  helper_method :tweets

  def user
    @user ||= User.find_by_username! params[:id]
  end
  helper_method :user
end
