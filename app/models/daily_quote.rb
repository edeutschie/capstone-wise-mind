class DailyQuote < ApplicationRecord

  validates :theme, presence: true, inclusion: {
    in: [ "motivational", "creativity", "adies_in_internship"]
  }
  validates :date_used, presence: true
  validates :theme, presence: true

  belongs_to :quote

  def self.check_for_daily_quote(theme)
    # look for daily quotes that are of the theme_choice and who's date is today
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
    #make an array of quote from that theme
    possible = Quote.where(theme: theme, public: true)
    while possible.length > 0
      proposed_quote = possible.sample
      possible -= [proposed_quote]
      #check to see that the date_used is long ago enough

      ########ACTION ITEM!
      #need to change this to 15 days once db is fleshed out.
      if proposed_quote.date_used + 8.days <= Date.today
      #make a new quote
        dailyquote = DailyQuote.new(date_used: Date.today, theme: proposed_quote.theme, quote_id: proposed_quote.id)
        if dailyquote.save
          proposed_quote.date_used = Date.today
          proposed_quote.save
          return dailyquote
        end
      end
    end
    if dailyquote
      return dailyquote
    else
      possible = Quote.where(theme: theme, public: true)
      proposed_quote = possible.sample
      dailyquote = DailyQuote.new(date_used: Date.today, theme: proposed_quote.theme, quote_id: proposed_quote.id)
      dailyquote.save
      proposed_quote.date_used = Date.today
      proposed_quote.save
      return dailyquote
    end
  end

  # def self.verify_dailyquote(dailyquote)
  #
  # end

end
