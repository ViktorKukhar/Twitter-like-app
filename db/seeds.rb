require 'factory_bot_rails'

# Clear existing data
User.destroy_all
Tweet.destroy_all

# Create users
FactoryBot.create_list(:user, 10)

# Get all created users
users = User.all

# Randomly select 7 users and assign each of them a random number of tweets (between 1 and 5)
users.sample(7).each do |user|
  # Create a random number of tweets for each selected user
  rand(1..5).times { FactoryBot.create(:tweet, user: user) }
end
