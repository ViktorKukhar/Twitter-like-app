require 'factory_bot_rails'

# Clear existing data
User.destroy_all
Tweet.destroy_all

# Create Users
10.times do
  FactoryBot.create(:user)
end

users = User.all

# Create Tweets
50.times do
  FactoryBot.create(:tweet, user: users.sample)
end
