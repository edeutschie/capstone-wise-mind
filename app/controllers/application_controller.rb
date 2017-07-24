class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session

  def current_user
    puts "params:"
    puts params
    token = params[:token]
    puts "token:"
    puts token
    payload = TokiToki.decode(token)
    # @current_user ||= User.find_by_login(payload[0]['sub'])
    User.find_by_login(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end
