class PublicTimelineController < TimelineController
protected
  def tweets
    @tweets ||= Tweet.all
  end
  helper_method :tweets
end

