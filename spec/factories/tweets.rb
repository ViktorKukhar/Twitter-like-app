FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence(word_count: rand(5..15)) }
    association :user
  end
end
