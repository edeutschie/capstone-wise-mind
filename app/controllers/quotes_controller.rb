class QuotesController < ApplicationController
  before_action :authenticate_user!

  def index
    quotes = Quote.all

    render status: :ok, json: quotes
  end

  def show
    quote = Quote.find(params[:id])

    render status: :ok, json: quote
  end

  def create
    quote = Quote.new(quote_params)
    puts params[:quote].to_hash
    if quote.save
      render status: :ok, json: { id: quote.id }
    else
      render status: :bad_request, json: { errors: quote.errors.messages }
    end
  end

  def destroy
    quote = Quote.find_by(id: params[:id])
    if quote.nil?
      render status: :not_found
    else
      # if quote.user_id == user_id
        quote.destroy
        render status: :no_content
      # else
      #   render status: :unauthorized, json: { error: 'You must have submitted a quote to be authorized to delete it.' }
      # end
    end
  end

  def theme
    theme = params[:theme]
    theme_quotes = Quote.where(theme: theme)

    render status: :ok, json: theme_quotes
  end

  # def daily_quote
  #   daily_quote = "Listen to your Wise Mind"
  #   # proposed_quote = Quote.order("RANDOM()").first
  #
  #   # # proposed_quote = ""
  #   # until proposed_quote.date_used + 3.days <= Date.today
  #   #   proposed_quote = Quote.order("RANDOM()").first
  #   # end
  #   #   proposed_quote = Quote.order("RANDOM()").first
  #   #   # return proposed_qu
  #   # end
  #   # #    if proposed_quote.date_used + 32.days >= Date.today
  #   # daily_quote = proposed_quote
  #   # proposed_quote.date_used = Date.today
  #   # proposed_quote.save
  #
  #   # daily_quote = "Listen to your Wise Mind"
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

  def quote_params
    params.require(:quote).permit(:text, :author, :theme, :public, :user_id)
  end

end
