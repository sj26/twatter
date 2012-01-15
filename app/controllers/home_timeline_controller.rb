class HomeTimelineController < TimelineController

private

  def statuses
    @statuses ||= current_user.statuses_and_following_statuses.includes(:user).order("statuses.created_at desc")
  end
  helper_method :statuses
end
