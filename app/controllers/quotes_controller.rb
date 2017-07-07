class QuotesController < ApplicationController

  def index
    quotes = Quote.all

    render status: :ok, json: quotes
  end

  def show
    quote = Quote.find(params[:id])

    render status: :ok, json: quote
  end

end
