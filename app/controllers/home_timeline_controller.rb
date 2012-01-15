class HomeTimelineController < TimelineController

private

  def statuses
    @statuses ||= current_user.statuses
  end
  helper_method :statuses
end
