class TweetsController < ApplicationController
  before_filter :tweet_user_only, only: :destroy

  def create
    @tweet = current_user.tweets.build params[:tweet]
    if @tweet.save
      redirect_to :back, flash: {success: "Tweeted"}
    else
      redirect_to :back, flash: {error: "Couldn't create tweet"}
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    if tweet.destroy
      redirect_to :back, flash: {success: "Tweet deleted"}
    else
      redirect_to :back, flash: {error: "Couldn't delete tweet"}
    end
  end

protected

  def reply_to
    @reply_to ||= Tweet.find params[:tweet][:reply_to_id]
  end
  helper_method :reply_to

  def tweet
    @tweet ||= Tweet.find params[:id]
  end

  def tweet_user_only
    head :forbidden unless current_user == tweet.user
  end
end
