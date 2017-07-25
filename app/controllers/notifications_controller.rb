class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token
    # before_validation :clean_up_phone_num

  def notify
    # login = TokiToki.decode(params[:token]).first["sub"]
    # user = User.find_by(login: login)
    # theme = user.theme_choice
    theme = params
    phone_num = params
    clean_num = phone_num.gsub(/[^0-9]/, '')
    ready_num = "+1" + clean_num


    # to_num = phone_num.clean_up_phone_num

    # theme = "adies_in_internship"
    daily_quote = DailyQuote.check_for_daily_quote(theme)
    # daily_quote = DailyQuote.find_by(theme: theme, date_used: Date.today)
    # quote = Quote.find_by(id: daily_quote.quote_id)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+12068008950', to: ready_num, body: "'#{daily_quote.text}'" + "\n" + "- #{daily_quote.author}"
    # message = client.messages.create from: '+12068008950', to: '+12069203088', body: 'Learning to send SMS you are.'
    render plain: message.status
  end

  def clean_up_phone_num
    # self.phone_num = self.phone_num.gsub(/[^0-9]/, '') #unless phone_num.nil?
    clean_num = phone_num.gsub(/[^0-9]/, '')
    ready_num = "+1" + clean_num
    return ready_num
  end

end
