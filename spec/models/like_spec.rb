require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }
  let(:like) { build(:like, user: user, tweet: tweet) }
  # Associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tweet) }

  # Validations
  it 'validates uniqueness of user_id scoped to tweet_id' do
    expect(like).to validate_uniqueness_of(:user_id).scoped_to(:tweet_id)
  end
end
