FactoryBot.define do
  factory :redirect do
    account
    from { "http://example.com" }
    to { "https://www.example.com" }
    active { true }
  end
end
