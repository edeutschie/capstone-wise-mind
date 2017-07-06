require "test_helper"

describe Quote do
  let(:quote) { Quote.new }

  it "must be valid" do
    value(quote).must_be :valid?
  end
end
