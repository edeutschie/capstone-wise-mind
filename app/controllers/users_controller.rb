class UsersController < ApplicationController

  def index
    users = User.all

    render status: :ok, json: users
  end

  def show
    user = User.find(params[:id])

    render status: :ok, json: user
  end

end
