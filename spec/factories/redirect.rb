FactoryBot.define do
  factory :redirect do
    user
    destination { "https://www.example.com" }
    active { true }
  end
end
