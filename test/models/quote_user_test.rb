require "test_helper"

describe QuoteUser do
  let(:quote_user) { QuoteUser.new }

  it "must be valid" do
    value(quote_user).must_be :valid?
  end
end
