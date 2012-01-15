class HomeTimelineController < TimelineController

private

  def tweets
    @tweets ||= current_user.tweets_and_following_tweets.includes(:user).order("tweets.created_at desc")
  end
  helper_method :tweets
end
