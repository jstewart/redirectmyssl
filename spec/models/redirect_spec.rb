require "rails_helper"

RSpec.describe Redirect, type: :model do
  context "Validations" do
    it { should validate_presence_of(:destination) }
    it { should allow_value("foo.example.com").for(:destination) }
    it { should_not allow_value("^^*.com").for(:destination) }
  end

  context "Associations" do
    it { should belong_to(:account) }
    it { should have_many(:hosts) }
  end
end
