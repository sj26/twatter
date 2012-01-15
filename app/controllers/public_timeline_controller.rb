class PublicTimelineController < TimelineController
protected
  def statuses
    @statuses ||= Status.all
  end
  helper_method :statuses
end

