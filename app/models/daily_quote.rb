class DailyQuote < ApplicationRecord

  validates :theme, presence: true, inclusion: {
    in: [ "motivational", "creativity", "my quotes", "shuffle"]
  }
  validates :date_used, presence: true
  validates :theme, presence: true

  belongs_to :quote

  def self.check_for_daily_quote(theme)
    # look for daily quotes that are of the theme_choice and
    #who's date is today
    dailyquote = DailyQuote.find_by(theme: theme, date_used: Date.today)
    if dailyquote
    # return above dailyquote
      return dailyquote.quote
    else
      dailyquote = generate_dailyquote(theme)
    end
    return dailyquote.quote
  end

  def self.generate_dailyquote(theme)
    puts "inside generate_dailyquote 1"
    #do a random call for a quote
    possible = Quote.where(theme: theme, public: true)

    proposed_quote = possible.sample
    possible.delete(proposed_quote)
    # Quote.order("RANDOM()").first
    #check to see that the date_used is long ago enough

    ########ACTION ITEM!
    #need to change this to 15 days once db is fleshed out.
    if proposed_quote.date_used + 3.days <= Date.today
      puts "inside first if loop"
    #make a new quote
      dailyquote = DailyQuote.new(date_used: Date.today, theme: proposed_quote.theme, quote_id: proposed_quote.id)
      if dailyquote.save
          puts "inside second if loop"
        proposed_quote.date_used = Date.today
        proposed_quote.save
      elsif possible.length > 0
        puts "inside first else loop"
        generate_dailyquote(theme)
     end
   else
       generate_dailyquote(theme)  # I GET STUCK HERE WITH THE RECURSIVE IF NO QUOTES LEFT
        puts "inside second else loop"
   end
   puts dailyquote
   return dailyquote
  end

  def verify_dailyquote
    
  end


  # def daily_quote
  #   daily_quote = "Listen to your Wise Mind"
  #     proposed_quote = Quote.order("RANDOM()").first
  #       # puts "we are before the if"
  #       #   puts proposed_quote.id
  #     if proposed_quote.date_used + 3.days <= Date.today
  #         # puts "we are in the if"
  #
  #   #    if proposed_quote.date_used + 32.days >= Date.today
  #       daily_quote = proposed_quote
  #       proposed_quote.date_used = Date.today
  #       proposed_quote.save
  #     else
  #       # puts "we are in the else"
  #     end
  #       # puts "we are outside the if"
  #
  #   render status: :ok, json: daily_quote
  #
  # end

end
