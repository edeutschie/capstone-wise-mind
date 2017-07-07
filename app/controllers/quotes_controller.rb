class QuotesController < ApplicationController

  def index
    quotes = Quote.all

    render status: :ok, json: quotes
  end

end
