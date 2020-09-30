require "rails_helper"

RSpec.describe "redirects/index", type: :view do
  before(:each) do
    assign(:redirects, [create(:redirect), create(:redirect)])
  end

  it "renders a list of redirects" do
    render
    assert_select "tr>td", text: "http://example.com", count: 2
    assert_select "tr>td", text: "https://www.example.com", count: 2
    assert_select "tr>td", text: "true", count: 2
  end
end
