class PublicTimelinesController < TimelineController

protected

  def tweets
    @tweets ||= Tweet.includes(:user).order("tweets.created_at desc")
  end
  helper_method :tweets

  def user
    current_user
  end
  helper_method :user
end

