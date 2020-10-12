FactoryBot.define do
  factory :user do
    name { "Ms. Foo Bar" }
    password { "P@ssw0rD!" }
    password_confirmation { "P@ssw0rD!" }
    sequence(:email) { |n| "foo#{n}@example.com" }

    trait :admin do
      admin { true }
    end
  end
end
