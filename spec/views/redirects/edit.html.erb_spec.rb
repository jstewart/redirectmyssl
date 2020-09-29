require "rails_helper"

RSpec.describe "redirects/edit", type: :view do
  before(:each) do
    account = Account.create!(email: "foo@bar.com", name: "Test")
    @redirect = assign(:redirect, Redirect.create!(
                                    from: "MyString",
                                    to: "MyString",
                                    active: false,
                                    account: account)
    )
  end

  it "renders the edit redirect form" do
    render

    assert_select "form[action=?][method=?]", redirect_path(@redirect), "post" do
      assert_select "input[name=?]", "redirect[from]"

      assert_select "input[name=?]", "redirect[to]"

      assert_select "input[name=?]", "redirect[active]"
    end
  end
end
