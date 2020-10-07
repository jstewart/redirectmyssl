require "rails_helper"

RSpec.describe RedirectsHelper, type: :helper do
  context "#with_built_host" do
    it "builds a new record for nested form" do
      redirect = build(:redirect)
      redirect.hosts.length.should eq(0)
      helper.with_built_host(redirect)
      redirect.hosts.length.should eq(1)
    end
  end
end
