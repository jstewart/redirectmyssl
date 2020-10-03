require "rails_helper"

RSpec.describe Redirect, type: :model do
  context "Validations" do
    it { should validate_presence_of(:destination) }
  end

  context "Associations" do
    it { should belong_to(:account) }
    it { should have_many(:hosts) }
  end
end
