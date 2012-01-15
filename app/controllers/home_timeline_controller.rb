class HomeTimelineController < TimelineController

protected

  def tweets
    @tweets ||= current_user.tweets_and_following_tweets.includes(:user).order("tweets.created_at desc").offset(params[:page].to_i * 20).limit(20)
  end
  helper_method :tweets

  def user
    current_user
  end
  helper_method :user
end
