class AuthenticationController < ApplicationController
  def github
    authenticator = Authenticator.new
    user_info = authenticator.github(params[:code])
    # binding.pry
    login = user_info[:login]
    name = user_info[:name]
    # avatar_url = user_info[:avatar_url]

    # Generate token...
    token = TokiToki.encode(login)
    # ... create user if it doesn't exist...
    loggedInUser = User.where(login: login).first_or_create!(
      username: name || login,
      theme_choice: "motivational"
      # avatar_url: avatar_url
    )
    # ... and redirect to client app.
    # response.cookies["userID"] = loggedInUser.id
    redirect_to "#{issuer}?token=#{token}"
  rescue StandardError => error
    redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['WISEMINDING_CLIENT_URL']
  end
end
