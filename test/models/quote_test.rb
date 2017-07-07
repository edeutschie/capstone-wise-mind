require "test_helper"

describe Quote do
  let(:quote) { Quote.new }

  describe "validations" do
    it "must be valid" do
      quote = quotes(:borrower)
      value(quote).must_be :valid?
    end

    it "can be created with all attributes" do
      quote = Quote.create!(text: 'This is a Zappa quote.', theme: 'Motivational', public: true, user_id: nil)
      quote.valid?.must_equal true
    end

      it "requires text" do
        quote = Quote.new(author: 'Frank Zappa', theme: 'Motivational', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :text
      end

      it "requires presence of text" do
        quote = Quote.new(text: '', author: 'Frank Zappa', theme: 'Motivational', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :text
      end

      it "requires an author" do
        quote = Quote.new(text: 'This is a second Zappa quote.', theme: 'Motivational', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :author
      end

      it "requires presence of an author" do
        quote = Quote.new(text: 'This is a third Zappa quote.', author: ' ', theme: 'Motivational', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :author
      end

      it "requires a theme" do
        quote = Quote.new(text: 'This is a fourth Zappa quote.', author: 'Frank Zappa', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :theme
      end

      it "requires presence of a theme" do
        quote = Quote.new(text: 'This is a Zappa quote.', author: 'Frank Zappa', theme: ' ', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :theme
      end

      it "requires an app approved theme" do
        quote = Quote.new(text: 'This is a Zappa quote.', author: 'Frank Zappa', theme: 'Not a Theme', public: true, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :theme
      end

      it "requires boolean for the public field" do
        quote = Quote.new(text: 'This is a Zappa quote.', author: 'Frank Zappa', theme: 'Motivational', user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :public
      end

      it "requires boolean/not an integer for the public field" do
        quote = Quote.new(text: 'This is a Zappa quote.', author: 'Frank Zappa', theme: 'Motivational', public: 43, user_id: nil)
        quote.valid?.must_equal false
        quote.errors.messages.must_include :public
      end
    end

    describe "relations" do

    end

end
