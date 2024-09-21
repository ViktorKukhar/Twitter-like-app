class HomeController < ApplicationController
  def index
    @tweets = Tweet.recent
    @new_tweet = Tweet.new(user: current_user)
  end
end
