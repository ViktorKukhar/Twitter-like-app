class HomeController < ApplicationController
  def index
    @tweets = collection

    if user_signed_in?
      @new_tweet = Tweet.new(user: current_user)
    end
  end

  private

  def collection
    Tweet.recent
  end
end
