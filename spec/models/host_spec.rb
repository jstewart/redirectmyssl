require "rails_helper"

RSpec.describe Host, type: :model do
  subject(:host) { build(:host) }

  describe "validations" do
    subject { create(:host) }
    it { should validate_presence_of(:hostname) }
    it { should validate_presence_of(:redirect_id) }
    it { should validate_uniqueness_of(:hostname) }
  end

  describe "url validation" do
    context "with an invalid hostname" do
      it "should be invalid with a bad hostname" do
        expect(host).not_to allow_value("^^*.com")
                    .for(:hostname)
                    .with_message("is not a valid hostname")
      end
    end
  end

  describe "associations" do
    it { should belong_to(:redirect) }
  end
end
