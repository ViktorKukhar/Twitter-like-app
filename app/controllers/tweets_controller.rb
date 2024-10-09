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
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:error] = @tweet.errors.full_messages.join(", ")

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("flash_messages", partial: "shared/flash_messages") }
      end
    end
  end

  def update
    @tweet = resource

    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = resource

    if @tweet.user_id == current_user.id
      @tweet.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@tweet) }
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully deleted.' }
      end
    else
      redirect_to tweets_path, alert: 'You are not authorized to delete this tweet.'
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
