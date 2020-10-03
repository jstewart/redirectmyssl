FactoryBot.define do
  factory :redirect do
    account
    destination { "https://www.example.com" }
    active { true }
  end
end
