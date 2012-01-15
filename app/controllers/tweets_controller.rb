class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.build params[:tweet]
    if @tweet.save
      redirect_to :back, notice: "Tweeted!"
    else
      redirect_to :back, alert: "Nope, try again."
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
end
