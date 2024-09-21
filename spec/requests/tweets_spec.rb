require 'rails_helper'

RSpec.describe "/tweets", type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "assigns @tweets and renders the index template" do
      get tweets_path
      expect(assigns(:tweets)).to eq(Tweet.recent)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns @tweet and renders the show template" do
      get tweet_path(tweet)
      expect(assigns(:tweet)).to eq(tweet)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new tweet to @tweet and renders the new template" do
      get new_tweet_path
      expect(assigns(:tweet)).to be_a_new(Tweet)
      expect(assigns(:tweet).user).to eq(user)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested tweet to @tweet and renders the edit template" do
      get edit_tweet_path(tweet)
      expect(assigns(:tweet)).to eq(tweet)
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new tweet and redirects to home_index_path" do
        expect {
          post tweets_path, params: { tweet: { body: "A new tweet", user_id: user.id } }
        }.to change(Tweet, :count).by(1)

        expect(response).to redirect_to(home_index_path)
        expect(flash[:notice]).to eq("Tweet was successfully created.")
      end
    end

    context "with invalid attributes" do
      it "does not create a new tweet and re-renders the new template" do
        expect {
          post tweets_path, params: { tweet: { body: "", user_id: user.id } }
        }.not_to change(Tweet, :count)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid attributes" do
      it "updates the tweet and redirects to the tweet" do
        patch tweet_path(tweet), params: { tweet: { body: "Updated tweet" } }
        tweet.reload
        expect(tweet.body).to eq("Updated tweet")
        expect(response).to redirect_to(tweet)
        expect(flash[:notice]).to eq("Tweet was successfully updated.")
        expect(response).to have_http_status(:see_other)
      end
    end

    context "with invalid attributes" do
      it "does not update the tweet and re-renders the edit template" do
        patch tweet_path(tweet), params: { tweet: { body: "" } }
        tweet.reload
        expect(tweet.body).not_to eq("")
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the tweet and redirects to tweets_url" do
      tweet_to_delete = create(:tweet, user: user)
      expect {
        delete tweet_path(tweet_to_delete)
      }.to change(Tweet, :count).by(-1)

      expect(response).to redirect_to(tweets_url)
      expect(flash[:notice]).to eq("Tweet was successfully destroyed.")
      expect(response).to have_http_status(:see_other)
    end
  end
end
