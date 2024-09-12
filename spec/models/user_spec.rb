require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:tweets) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:username) }
end
