class DailyQuoteController < ApplicationController

  #make controller with show method - for users to interact with
  #calls the logic to checks for quote with the current date in db

  def show
    puts "in the show method"
    theme = params[:theme]
    puts theme

    # if DailyQuote.where()

    #check to see if there is a Dailyquote in the system that is of the correct theme
    check_for_daily_quote(theme)
    #if there is
    render status: :ok, json: dailyquote

    # else
        # daily_quote = "no dice"

      #generate a new daily quote from the /call model method
      # dailyquote = DailyQuote.new
      # dailyquote.save
      # render status: :ok, json: dailyquote
    # end

    # render status: :ok, json: dailyquote
  end

end
