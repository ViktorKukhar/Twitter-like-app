FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    username { Faker::Internet.unique.username(specifier: 3..15, separators: ['_']) }
  end
end
