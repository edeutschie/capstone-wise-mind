class UsersController < ApplicationController

  def index
    users = User.all

    render status: :ok, json: users
  end

  def show
    user = User.find(params[:id])

    render status: :ok, json: user
  end

  def create
    user = User.new(user_params)
    puts params[:user].to_hash
    if user.save
      render status: :ok, json: { username: user.username, id: user.id }
    else
      render status: :bad_request, json: { errors: user.errors.messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_num, :email, :theme_choice)
  end

end
