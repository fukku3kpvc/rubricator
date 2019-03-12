FactoryBot.define do
  factory :node do
    trait :correct do
      title { 'Sample Node' }
      description { 'Lorem' * 50 }
    end

    trait :wrong do
      title { nil }
    end
  end
end