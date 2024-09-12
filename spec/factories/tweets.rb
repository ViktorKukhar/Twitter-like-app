FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence }
    association :user

    trait :retweet do
      body { nil }
      association :origin_id, factory: :tweet
      # Ensure the user is associated
      association :user_id
    end
  end
end