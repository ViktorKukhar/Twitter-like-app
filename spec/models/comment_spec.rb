require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Associations
  it { should belong_to(:user) }
  it { should belong_to(:tweet) }

  # Validations
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:tweet_id) }
end
