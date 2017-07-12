require "test_helper"

describe DailyQuote do
  let(:daily_quote) { DailyQuote.new }

  it "must be valid" do
    value(daily_quote).must_be :valid?
  end
end
