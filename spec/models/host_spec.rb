require "rails_helper"

RSpec.describe Host, type: :model do
  subject(:host) { build(:host) }

  describe "validations" do
    subject { create(:host) }

    it { puts host.inspect }
    it { should validate_presence_of(:hostname) }
    it { should validate_presence_of(:redirect_id) }
    it { should validate_uniqueness_of(:hostname) }
    it { should allow_value("foo.example.com").for(:hostname) }
    it { should_not allow_value("^^*.com").for(:hostname) }
  end

  describe "associations" do
    it { should belong_to(:redirect) }
  end
end
