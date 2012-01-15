class HomeTimelineController < TimelineController

private

  def statuses
    @statuses ||= current_user.following_statuses.includes(:user)
  end
  helper_method :statuses
end
