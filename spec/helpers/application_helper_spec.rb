require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_classes' do
    context 'when the flash type is notice' do
      it 'returns the correct class for notice' do
        expect(helper.flash_classes('notice')).to eq('notice')
      end
    end

    context 'when the flash type is alert' do
      it 'returns the correct class for alert' do
        expect(helper.flash_classes('alert')).to eq('alert')
      end
    end

    context 'when the flash type is unknown' do
      it 'returns the default class for unknown types' do
        expect(helper.flash_classes('unknown')).to eq('tweet-error')
      end
    end
  end

  describe '#page' do
    include_context :authenticated_user


    context 'when current_page is root_path' do
      it 'returns "For you" paragraph' do
        allow(helper).to receive(:root_path).and_return('/')
        expect(helper.page(root_path)).to eq('<h2>For you</h2>')
      end
    end

    context 'when current_page is new_user_session_path' do
      it 'returns "Log in" paragraph' do
        allow(helper).to receive(:new_user_session_path).and_return('/users/sign_in')
        expect(helper.page(new_user_session_path)).to eq('<h2>Log in</h2>')
      end
    end

    context 'when current_page is new_user_registration_path' do
      it 'returns "Sign up" paragraph' do
        allow(helper).to receive(:new_user_registration_path).and_return('/users/sign_up')
        expect(helper.page(new_user_registration_path)).to eq('<h2>Sign up</h2>')
      end
    end

    context 'when current_page is tweet_path' do
      it 'returns "Tweet" paragraph' do
        allow(helper).to receive(:tweet_path).and_return('/tweets/1')
        expect(helper.page(tweet_path(1))).to eq('<h2>Tweet</h2>')
      end
    end

    context "when on the user's profile page" do
      before do
        assign(:user, user)
        assign(:tweets, user.tweets)
      end

      it "returns the user's username and tweet count" do
        allow(helper).to receive(:users_profile_path).and_return("/users/#{user.id}/profile")

        result = helper.page("/users/#{user.id}/profile")

        expect(result).to include("<h3>#{user.username}</h3>")
        expect(result).to include("<p>#{user.tweets.count} tweets</p>")
      end
    end

    context 'when current_page is unknown' do
      it 'returns "Twitter" paragraph' do
        allow(helper).to receive(:tweet_path).and_return('/tweets/1')
        allow(helper).to receive(:users_profile_path).and_return('/users/profiles/1')
        expect(helper.page('/unknown_path')).to eq('<h2>Twitter</h2>')
      end
    end
  end
end
