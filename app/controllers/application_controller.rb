# class ApplicationController < ActionController::API
class ApplicationController < ActionController::Base

  # protect_from_forgery with: :null_session
  # protect_from_forgery with:  :null_session, :exception
  protect_from_forgery with:  :exception

  # protect_from_forgery except: ['action_name']


  def current_user
    # puts "params:"
    # puts params
    token = params[:token]
    # puts "token:"
    # puts token
    payload = TokiToki.decode(token)
    # puts "payload"
    # puts payload
    # puts "token"
    # puts token
    @current_user ||= User.find_by_login(payload[0]['sub'])

    # User.find_by_login(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end
