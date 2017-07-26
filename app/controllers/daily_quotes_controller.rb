class DailyQuotesController < ApplicationController
  # before_action :authenticate_user!

  #make controller with show method - for users to interact with
  #calls the logic to checks for quote with the current date in db

  def show
    puts "in show method"
    #establish theme
    theme = params[:theme]
    #check to see if there is a dailyquote in the system that is of the correct theme
    dailyquote = DailyQuote.check_for_daily_quote(theme)
    #if there is render quote as json, or throw errors
    if dailyquote
      render status: :ok, json: dailyquote
    else
      render status: :not_found, json: { errors: daily_quotes.errors.messages }
    end
  end

  private

  def dailyquote_params
    params.require(:dailyquote).permit(:theme, :quote_id, :date_used)
  end

end
