require 'rails_helper'
RSpec.describe "/tweets", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tweet.create! valid_attributes
      get tweets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tweet = Tweet.create! valid_attributes
      get tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tweet_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      tweet = Tweet.create! valid_attributes
      get edit_tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tweet" do
        expect {
          post tweets_url, params: { tweet: valid_attributes }
        }.to change(Tweet, :count).by(1)
      end

      it "redirects to the created tweet" do
        post tweets_url, params: { tweet: valid_attributes }
        expect(response).to redirect_to(tweet_url(Tweet.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tweet" do
        expect {
          post tweets_url, params: { tweet: invalid_attributes }
        }.to change(Tweet, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post tweets_url, params: { tweet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tweet" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: new_attributes }
        tweet.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tweet" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: new_attributes }
        tweet.reload
        expect(response).to redirect_to(tweet_url(tweet))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        tweet = Tweet.create! valid_attributes
        patch tweet_url(tweet), params: { tweet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete tweet_url(tweet)
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      tweet = Tweet.create! valid_attributes
      delete tweet_url(tweet)
      expect(response).to redirect_to(tweets_url)
    end
  end
end
