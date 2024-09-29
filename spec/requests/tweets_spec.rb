require 'rails_helper'

RSpec.describe "/tweets", type: :request do
  include_context "authenticated user"

  let!(:tweet) { create(:tweet, user: user) }

  describe 'GET /tweets/:id' do
    it 'returns a successful response for a valid tweet' do
      get tweet_path(tweet)

      expect(response).to be_successful

      expect(response.body).to include(tweet.body)
    end

    it 'returns a 404 response for an invalid tweet' do
      get tweet_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /tweets' do
    context 'with valid parameters' do
      it 'creates a new tweet and redirects to root path' do
        expect do
          post tweets_path, params: { tweet: { body: "New Tweet", user_id: user.id } }
        end.to change(Tweet, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new tweet and renders new template' do
        expect do
          post tweets_path, params: { tweet: { body: '', user_id: user.id } }
        end.not_to change(Tweet, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /tweets/:id/edit' do
    it 'returns a successful response' do
      get edit_tweet_path(tweet)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /tweets/:id' do
    context 'with valid parameters' do
      it 'updates the tweet and redirects to show path' do
        patch tweet_path(tweet), params: { tweet: { body: 'Updated Body' } }

        expect(response).to redirect_to(tweet_path(tweet))

        expect(tweet.reload.body).to eq('Updated Body')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the tweet and renders edit template' do
        patch tweet_path(tweet), params: { tweet: { body: '' } }

        expect(response).to have_http_status(:unprocessable_entity)

        expect(tweet.reload.body).not_to eq('')
      end
    end

    describe 'DELETE /tweets/:id' do
      it 'deletes the tweet and redirects to root path' do
        expect do
          delete tweet_path(tweet)
        end.to change(Tweet, :count).by(-1)

        expect(response).to redirect_to(root_path)
      end
    end

  end

end
