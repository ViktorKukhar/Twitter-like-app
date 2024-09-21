class TweetsController < ApplicationController
  # GET /tweets
  def index
    @tweets = Tweet.recent
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new(user: current_user)
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to home_index_path, notice: "Tweet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to tweets_url, notice: "Tweet was successfully destroyed.", status: :see_other
    else
      redirect_to tweets_path, notice: "There was an issue deleting the tweet."
    end
  end

  private

    # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :origin_id)
  end
end
