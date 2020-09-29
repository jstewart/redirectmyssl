require 'rails_helper'

RSpec.describe "redirects/new", type: :view do
  before(:each) do
    assign(:redirect, Redirect.new(
      from: "MyString",
      to: "MyString",
      active: false
    ))
  end

  it "renders new redirect form" do
    render

    assert_select "form[action=?][method=?]", redirects_path, "post" do

      assert_select "input[name=?]", "redirect[from]"

      assert_select "input[name=?]", "redirect[to]"

      assert_select "input[name=?]", "redirect[active]"
    end
  end
end
