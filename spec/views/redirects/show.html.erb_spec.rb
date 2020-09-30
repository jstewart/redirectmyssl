require "rails_helper"

RSpec.describe "redirects/show", type: :view do
  before(:each) do
    @redirect = assign(:redirect, create(:redirect))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/http:\/\/example\.com/)
    expect(rendered).to match(/https:\/\/\www\.example\.com/)
    expect(rendered).to match(/true/)
  end
end
