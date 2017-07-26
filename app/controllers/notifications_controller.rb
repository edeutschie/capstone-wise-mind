class NotificationsController < ApplicationController

  protect_from_forgery with:  :exception

  skip_before_action :verify_authenticity_token

  def notify
    txt_theme = params[:theme]
    phone_num = params[:phone_num]

    clean_num = phone_num.gsub(/[^0-9]/, '')
    ready_num = ""

    if clean_num.length == 11 && clean_num[0] == "1"
      ready_num = ("+" + clean_num)
      send_text(ready_num, txt_theme)
    elsif clean_num.length == 10
      ready_num = ("+1" + clean_num)
      send_text(ready_num, txt_theme)
    else
      render status: :bad_request, plain: "Number is wrong"
    end
  end

  def send_text(phone_num, theme)
    daily_quote = DailyQuote.check_for_daily_quote(theme)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+12068008950', to: phone_num, body: "'#{daily_quote.text}'" + "\n" + "- #{daily_quote.author}"
    render plain: message.status
  end

# #this all worked
  #   daily_quote = DailyQuote.check_for_daily_quote(theme)
  # # daily_quote = DailyQuote.find_by(theme: theme, date_used: Date.today)
  # # quote = Quote.find_by(id: daily_quote.quote_id)
  #   client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
  #   message = client.messages.create from: '+12068008950', to: ready_num, body: "'#{daily_quote.text}'" + "\n" + "- #{daily_quote.author}"
  # # message = client.messages.create from: '+12068008950', to: '+12069203088', body: 'Learning to send SMS you are.'
  #
  #   render plain: message.status
  # end

  def clean_up_phone_num
    clean_num = phone_num.gsub(/[^0-9]/, '')
    ready_num = "+1" + clean_num
    return ready_num
  end

  private

  def data_params
    params.permit(:phone_num, :theme, :login, :token, :notification)
  end

end
