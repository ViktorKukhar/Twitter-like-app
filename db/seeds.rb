require 'faker'

# Clear existing data
User.destroy_all
Tweet.destroy_all

# Create Users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password', # Set a default password for all users
    password_confirmation: 'password', # Ensure confirmation matches
    username: Faker::Internet.unique.username(specifier: 3..15, separators: ['_']) # Ensure username fits the validation
  )
end

users = User.all

# Create Tweets
50.times do
  Tweet.create!(
    body: Faker::Lorem.sentence(word_count: rand(5..15)),
    user: users.sample
  )
end

