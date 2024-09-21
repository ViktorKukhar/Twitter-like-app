require "rails_helper"

RSpec.describe TweetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: tweets_path).to route_to("tweets#index")
    end

    it "routes to #new" do
      expect(get: new_tweet_path).to route_to("tweets#new")
    end

    it "routes to #show" do
      expect(get: tweet_path(1)).to route_to("tweets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: edit_tweet_path(1)).to route_to("tweets#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: tweets_path).to route_to("tweets#create")
    end

    it "routes to #update via PUT" do
      expect(put: tweet_path(1)).to route_to("tweets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: tweet_path(1)).to route_to("tweets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: tweet_path(1)).to route_to("tweets#destroy", id: "1")
    end
  end
end
