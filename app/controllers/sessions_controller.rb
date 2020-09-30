class SessionsController < ApplicationController

  def index
    @sessions = Session.where(user_id: @user.id)
    render json: @sessions
  end

  def show
    @session = Session.find(params[:id])
    render json: @session
  end

  def create
    @session = Session.create(
      user_id: @user.id
    )
    render json: @session
  end
end
