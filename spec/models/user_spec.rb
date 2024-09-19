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
end
