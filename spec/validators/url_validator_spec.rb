require "rails_helper"

module Test
  UrlValidatable = Struct.new(:url) do
    include ActiveModel::Validations

    validates :url, url: true
  end
end

RSpec.describe UrlValidator, type: :model do
  subject(:validator) { Test::UrlValidatable.new("foo.example.com") }
  it { should be_valid }

  context "with some non rfc compliant characters" do
    before do
      validator.url = "https://foo.ba^.example.com/test"
    end

    it { should_not be_valid }
  end
end
