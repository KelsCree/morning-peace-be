class UsersController < ApplicationController

  def create
    @user = User.create(
      username: params[:username],
      firstname: params[:firstname],
      password: params[:password]
    )
    render json: @user
  end


end