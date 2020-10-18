require "rails_helper"

RSpec.describe RedirectsHelper, type: :helper do
  context "#with_built_host" do
    it "builds a new record for nested form" do
      redirect = build(:redirect)
      expect(redirect.hosts.length).to eq(0)
      helper.with_built_host(redirect)
      expect(redirect.hosts.length).to eq(1)
    end
  end
end
