require 'rails_helper'

RSpec.describe Tweet, type: :model do
  # Associations
  it { should belong_to(:user) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should belong_to(:origin).class_name('Tweet').optional }

  # Validations
  it { should validate_presence_of(:user_id) }

  context 'when the tweet is an original tweet (not a retweet)' do
    subject { build(:tweet, origin: nil) }

    it { should validate_presence_of(:body) }

    it {
      should validate_length_of(:body)
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
      subject.body = 'A' * 300
      expect(subject).not_to be_valid
      expect(subject.errors[:body]).to include('is too long (maximum is 280 characters)')
    end

    it 'is valid when body length is within allowed range' do
      subject.body = 'A' * 50
      expect(subject).to be_valid
    end
  end
end
