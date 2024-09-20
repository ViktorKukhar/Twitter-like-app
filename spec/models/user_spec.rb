require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:comments) }

  # Validations
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(50) }
  it { is_expected.to allow_value('valid_username').for(:username) }
  it { is_expected.not_to allow_value('invalid username!').for(:username).with_message("only allows letters, numbers, and underscores") }

end
