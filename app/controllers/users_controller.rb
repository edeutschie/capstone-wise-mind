class UsersController < ApplicationController
  before_action :authenticate_user!  #exception

  # def index
  #   users = User.all
  #
  #   render status: :ok, json: users
  # end

  def show

    login = TokiToki.decode(params[:token]).first["login"]
    # login = TokiToki.decode(params[:token]).first["sub"]
    # fix above with error checking
    user = User.find_by(login: login)
    if user
      render status: :ok, json: user
    else
      render status: :not_found, json: { errors: user.errors.messages }
    end
  end

  # def create
  #   user = User.new(user_params)
  #   puts params[:user].to_hash
  #   if user.save
  #     render status: :ok, json: { username: user.username, id: user.id }
  #   else
  #     render status: :bad_request, json: { errors: user.errors.messages }
  #   end
  # end

  def update
    login = TokiToki.decode(params[:token]).first["sub"]
    user = User.find_by(login: login)
    if user.nil?
      render status: :not_found
    else
      user.update_attributes(user_params)
      if user.save
        render status: :ok, json: user
      else
        puts user.errors.messages
        render status: :bad_request, json: { errors: user.errors.messages }
      end
    end
  end

  # def destroy
  #   login = TokiToki.decode(token)
  #   user = User.find_by(login: login)
  #   # user = @user#.User.find_by(id: params[:id])
  #   if user.nil?
  #     render status: :not_found
  #   else
  #     # if quote.user_id == user_id
  #       user.destroy
  #       render status: :no_content
  #     # else
  #     #   render status: :unauthorized, json: { error: 'You must have submitted a quote to be authorized to delete it.' }
  #     # end
  #   end
  # end

  # def submitted_quotes
  #   # require_login
  #   # user = User.find_by(id: user.id)
  #   user = User.find_by(id: params[:id])
  #   render json: user.submitted_quotes
  # end

  private

  def user_params
    params.require(:user).permit(:username, :phone_num, :email, :theme_choice, :login)
  end

end
