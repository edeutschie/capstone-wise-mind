class UsersController < ApplicationController

  def index
    users = User.all

    render status: :ok, json: users
  end

end
