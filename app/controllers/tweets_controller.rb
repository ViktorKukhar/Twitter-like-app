class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy

  def show
    @tweet = resource
  end

  def new
    @tweet = Tweet.new(user: current_user)
  end

  def edit
    @tweet = resource

    respond_to :turbo_stream
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        flash[:notice] = 'Tweet was successfully created.'
      else
        flash.now[:error] = @tweet.errors.full_messages.join(", ")
      end

      format.turbo_stream
    end
  end

  def update
    @tweet = resource

    respond_to do |format|
      if @tweet.update(tweet_params)
        flash.now[:notice] = "Tweet was successfully updated."
      else
        flash.now[:error] = @tweet.errors.full_messages.join(", ")
      end

      format.turbo_stream
    end
  end

  def destroy
    @tweet = resource

    respond_to do |format|
      if @tweet.destroy
        flash.now[:notice] = "Tweet was successfully destroyed."
      else
        flash.now[:error] = @tweet.errors.full_messages.join(", ")
      end

      format.turbo_stream
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :origin_id)
  end

  def collection
    Tweet.includes(:user).recent
  end

  def resource
    collection.find(params[:id])
  end

  def authorize_user!
    @tweet = current_user.tweets.find(params[:id])
  end
end
