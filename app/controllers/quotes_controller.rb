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

  private

  def quote_params
    params.require(:quote).permit(:text, :author, :theme, :public, :user_id)
  end

end
