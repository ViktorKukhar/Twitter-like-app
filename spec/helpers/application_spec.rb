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
    context 'when current_page is root_path' do
      it 'returns "For you" paragraph' do
        allow(helper).to receive(:root_path).and_return('/')
        expect(helper.page(root_path)).to eq('<p>For you</p>')
      end
    end

    context 'when current_page is new_user_session_path' do
      it 'returns "Log in" paragraph' do
        allow(helper).to receive(:new_user_session_path).and_return('/users/sign_in')
        expect(helper.page(new_user_session_path)).to eq('<p>Log in</p>')
      end
    end

    context 'when current_page is new_user_registration_path' do
      it 'returns "Sign up" paragraph' do
        allow(helper).to receive(:new_user_registration_path).and_return('/users/sign_up')
        expect(helper.page(new_user_registration_path)).to eq('<p>Sign up</p>')
      end
    end

    context 'when current_page is tweet_path' do
      it 'returns "Tweet" paragraph' do
        allow(helper).to receive(:tweet_path).and_return('/tweets/1')
        expect(helper.page(tweet_path(1))).to eq('<p>Tweet</p>')
      end
    end

    context 'when current_page is unknown' do
      it 'returns "Twitter" paragraph' do
        allow(helper).to receive(:tweet_path).and_return('/tweets/1')
        expect(helper.page('/unknown_path')).to eq('<p>Twitter</p>')
      end
    end
  end

end
