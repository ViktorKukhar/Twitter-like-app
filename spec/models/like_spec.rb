require 'rails_helper'

RSpec.describe Like, type: :model do
  # Associations
  it { should belong_to(:user) }
  it { should belong_to(:tweet) }

  # Validations
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:tweet_id) }

  context 'uniqueness validation' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }

    subject { build(:like, user: user, tweet: tweet) }

    before do
      create(:like, user: user, tweet: tweet)
    end

    it 'validates uniqueness of user scoped to tweet' do
      expect(subject).to validate_uniqueness_of(:user_id)
                           .scoped_to(:tweet_id)
                           .with_message('You can like a tweet only once')
    end
  end
end
