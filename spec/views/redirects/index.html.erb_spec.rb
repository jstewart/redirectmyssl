require "rails_helper"

RSpec.describe "redirects/index", type: :view do
  before(:each) do
    account = Account.create!(email: "foo@bar.com", name: "Test")
    assign(:redirects, [
      Redirect.create!(
        from: "From",
        to: "To",
      active: false,
      account: account),
      Redirect.create!(
        from: "From",
        to: "To",
        active: false,
        account: account)
    ])
  end

  it "renders a list of redirects" do
    render
    assert_select "tr>td", text: "From".to_s, count: 2
    assert_select "tr>td", text: "To".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
