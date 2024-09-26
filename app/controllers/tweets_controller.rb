class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @tweets = Tweet.recent
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new(user: current_user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: "Tweet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.destroy
      redirect_to root_path, notice: "Tweet was successfully destroyed.", status: :see_other
    else
      redirect_to tweets_path, notice: "There was an issue deleting the tweet."
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :origin_id)
  end
end