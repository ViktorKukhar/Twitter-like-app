require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tweet) }

  # Validations
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5).is_at_most(200) }
end
