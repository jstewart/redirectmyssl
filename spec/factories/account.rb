FactoryBot.define do
  factory :account do
    name { "John Doe" }
    email  { "john@example.com" }

    trait :invalid do
      valid? { false }
    end

    trait :missing_email do
      email { nil }
    end
  end
end
