class HomeController < ApplicationController
  def index
    @tweets = Tweet.recent
    if user_signed_in?
    @new_tweet = Tweet.new(user: current_user)
    end
  end
end
