class StatusesController < ApplicationController
  def create
    @status = current_user.statuses.build params[:status]
    if @status.save
      redirect_to :back, notice: "Tweeted!"
    else
      redirect_to :back, alert: "Nope, try again."
    end
  end

  def show
    @status = Status.find(params[:id])
  end
end
