FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.username(specifier: 5..10) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
