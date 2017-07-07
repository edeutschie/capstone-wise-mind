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
      render status: :bad_request, json: { errors: quote.errors.messages}
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :author, :theme, :public, :user_id)
  end

end
