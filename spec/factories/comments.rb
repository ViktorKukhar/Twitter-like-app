FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    association :user
    association :tweet
  end
end
