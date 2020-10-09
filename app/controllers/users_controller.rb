class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create, :login]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: @user, include: [:sessions, :entries]
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      @token = JWT.encode({ user_id: @user.id }, ENV['SECRET_KEY_BASE'])
      render json: { token: @token, user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      @token = JWT.encode({ user_id: @user.id }, ENV['SECRET_KEY_BASE'])
      render json: { token: @token, user: @user }, status: :ok
    else
      render json: { message: 'Invalid username or password - try again!' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :firstname,
      :password
    )
  end

end