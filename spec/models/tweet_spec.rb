require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to(:origin).class_name('Tweet').optional }
  end

  context 'when the tweet is an original tweet (not a retweet)' do
    subject { build(:tweet, origin: nil) }

    it { is_expected.to validate_presence_of(:body) }

    it {
      is_expected.to validate_length_of(:body)
               .is_at_least(1)
               .is_at_most(280)
    }
  end
  context 'when the tweet is a retweet' do
    let(:user) { create(:user) }
    let(:original_tweet) { create(:tweet) }
    subject { build(:tweet, user: user, origin: original_tweet, body: nil) }

    it 'does not require body to be present' do
      expect(subject).to be_valid
    end

    it 'is valid when body is absent' do
      expect(subject.valid?).to be true
    end

    it 'validates length of body if present' do
      is_expected.to validate_length_of(:body).is_at_most(280)
    end

    it 'is valid when body length is within allowed range' do
      expect(subject).to be_valid
    end
  end
end
