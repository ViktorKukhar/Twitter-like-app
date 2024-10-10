class TweetsController < ApplicationController
  before_action :authenticate_user!
  def show
    @tweet = resource
  end

  def new
    @tweet = Tweet.new(user: current_user)
  end

  def edit
    @tweet = resource

    respond_to do |format|
      format.turbo_stream
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      flash[:notice] = 'Tweet was successfully created.'

      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:error] = @tweet.errors.full_messages.join(", ")

      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def update
    @tweet = resource

    respond_to do |format|
      if @tweet.update(tweet_params)
        flash.now[:notice] = "Tweet was successfully updated."

        format.turbo_stream
      else
        flash.now[:error] = @tweet.errors.full_messages.join(", ")

        format.turbo_stream
      end
    end
  end

  def destroy
    @tweet = resource

    if @tweet.user_id == current_user.id
      flash.now[:notice] = "Tweet was successfully destroyed."

      @tweet.destroy
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:error] = @tweet.errors.full_messages.join(", ")
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :origin_id)
  end

  def collection
    Tweet.recent
  end

  def resource
    collection.find(params[:id])
  end
end
