class PublicTimelinesController < TimelineController

protected

  def tweets
    @tweets ||= Tweet.includes(:user).order("tweets.created_at desc").offset(params[:page].to_i * 20).limit(20)
  end
  helper_method :tweets
end

