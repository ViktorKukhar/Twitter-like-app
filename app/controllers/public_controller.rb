class PublicController < ApplicationController
  def index
    @tweet = Tweet.all.order(created_at: :desc)
    @new_tweet = Tweet.new(user: current_user)
  end
end
