class QuotesController < ApplicationController

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

  def daily_quote
    potential_quote = Quote.order("RANDOM()").first
    if potential_quote.date_used + 32.days >= Date.today
      daily_quote = potential_quote
      quote.date_used = Date.today


    render status: :ok, json: daily_quote

    # @motivational_quote = Quote.order("RANDOM()").first
    # @creativity_quote =

    # data = Hash[row.headers.zip(row.fields)]
    # data[:category] = ["air", "tropical", "succulents", "cacti", "herbs", "trees", "planters"].sample
    # data[:merchant_id] = rand(1..21)
    # Product.create!(data)

  end

  def quote_params
    params.require(:quote).permit(:text, :author, :theme, :public, :user_id)
  end

end
