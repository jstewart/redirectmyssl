require "rails_helper"

RSpec.describe "redirects/show", type: :view do
  before(:each) do
    account = Account.create!(email: "foo@bar.com", name: "Test")
    @redirect = assign(:redirect, create(:redirect))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/To/)
    expect(rendered).to match(/true/)
  end
end
