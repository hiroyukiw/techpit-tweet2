class TweetsController < ApplicationController
  def index
  end

  def new
    @tweet = Tweet.new
  end

  # ==========ここから追加する==========
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
      flash[:notice] = "ツイートを送信しました。"
    else
      redirect_to new_tweet_path
      flash[:alert] = "ツイートに失敗しました。"
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text).merge(user_id: current_user.id)
    end
  # ==========ここまで追加する==========

end