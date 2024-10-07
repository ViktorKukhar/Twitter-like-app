require 'rails_helper'

RSpec.describe "Users::Profiles", type: :request do
  include_context :valid_tweet
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "GET #show" do
    context "when user is logged in" do
      before do
        sign_in user
        get users_profile_path(user.id)
      end

      it "displays the correct user information" do
        expect(response.body).to include(user.username)
      end

      it "displays the user's recent tweets" do
        recent_tweets.each do |tweet|
          expect(response.body).to include(tweet.body)
        end
      end

      it "returns a 200 successful status" do
        expect(response).to be_successful
      end
    end

    context "when user is not logged in" do
      before do
        get users_profile_path(user.id)
      end

      it "redirects to the login page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "returns a 302 status for redirection" do
        expect(response).to have_http_status(:found)
      end
    end

    context "when viewing another user's profile" do
      before do
        sign_in user
        get users_profile_path(other_user.id)
      end

      it "displays the correct other user's information" do
        expect(response.body).to include(other_user.username)
      end

      it "displays the other user's recent tweets" do
        other_user.tweets.recent.each do |tweet|
          expect(response.body).to include(tweet.body)
        end
      end

      it "returns a 200 successful status" do
        expect(response).to be_successful
      end
    end
  end
end
