class UserTimelinesController < TimelineController
  layout "user"

protected

  def tweets
    @tweets ||= user.tweets.order("tweets.created_at desc").offset(params[:page].to_i * 20).limit(20)
  end
  helper_method :tweets

  def user
    @user ||= User.find_by_username! params[:id]
  end
  helper_method :user
end
